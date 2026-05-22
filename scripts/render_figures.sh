#!/usr/bin/env bash
# ============================================================
#  render_figures.sh — rasterise the TikZ figures to PNG.
#
#  Each latex/figures/*.tex file holds one tikzpicture. This script
#  compiles each inside a standalone wrapper and converts it to a PNG
#  (latex/figures/<name>.png) for the pandoc/Word pipeline. The LaTeX
#  PDF build does NOT use these PNGs — it \input{}s the TikZ directly.
#
#  Usage:  scripts/render_figures.sh
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LATEX_DIR="$(cd "${SCRIPT_DIR}/../latex" && pwd)"
FIG_DIR="${LATEX_DIR}/figures"

TMPD="$(mktemp -d -t nexus_fig_XXXX)"
trap 'rm -rf "${TMPD}"' EXIT

status=0
for fig in "${FIG_DIR}"/fig_*.tex; do
  [[ -e "${fig}" ]] || { echo "[render_figures] no figure files found"; exit 0; }
  name="$(basename "${fig}" .tex)"
  wrapper="${TMPD}/${name}.tex"
  cat > "${wrapper}" <<EOF
\documentclass[border=6pt]{standalone}
\input{${LATEX_DIR}/tikz-setup}
\begin{document}
\input{${LATEX_DIR}/figures/${name}}
\end{document}
EOF
  if ( cd "${TMPD}" && pdflatex -interaction=nonstopmode -halt-on-error \
          "${name}.tex" >/dev/null 2>&1 ); then
    pdftoppm -png -r 200 -singlefile "${TMPD}/${name}.pdf" "${FIG_DIR}/${name}"
    echo "[render_figures] ok   -> ${name}.png"
  else
    echo "[render_figures] FAIL -> ${name}"
    ( cd "${TMPD}" && pdflatex -interaction=nonstopmode "${name}.tex" 2>&1 \
        | grep -E '^(!|l\.[0-9]|.*Error)' | head -12 )
    status=1
  fi
done
exit "${status}"
