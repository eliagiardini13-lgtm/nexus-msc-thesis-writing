#!/usr/bin/env bash
# ============================================================
#  build_all.sh — full build: every chapter to Word + the thesis PDF.
#
#  1. Converts every latex/chapters/NN_*.tex to word/NN_*.docx.
#  2. Compiles the complete thesis to latex/main.pdf.
#
#  Usage:  scripts/build_all.sh
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LATEX_DIR="$(cd "${SCRIPT_DIR}/../latex" && pwd)"

echo "=== build_all: chapters -> Word ==="
for tex in "${LATEX_DIR}"/chapters/*.tex; do
  num="$(basename "${tex}" | grep -oE '^[0-9]+' || true)"
  [[ -z "${num}" ]] && continue
  "${SCRIPT_DIR}/chapter_to_word.sh" "${num}"
done

echo
echo "=== build_all: full thesis -> PDF ==="
"${SCRIPT_DIR}/build_latex.sh"

echo
echo "=== build_all: complete ==="
