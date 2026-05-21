#!/usr/bin/env bash
# ============================================================
#  chapter_to_word.sh — convert one chapter's LaTeX to Word (.docx).
#
#  Takes a chapter number, finds latex/chapters/NN_*.tex, and converts
#  it to word/NN_<name>.docx via pandoc. Citations are resolved against
#  the project bibliography and rendered author-year (CSL); a chapter
#  title page and an end-of-chapter reference list are added.
#
#  Usage:  scripts/chapter_to_word.sh 3
#  Output: word/03_architecture.docx
# ============================================================
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 CHAPTER_NUM   (e.g. $0 3)" >&2
  exit 1
fi

NUM="$(printf '%02d' "$1")"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
LATEX_DIR="${ROOT_DIR}/latex"
WORD_DIR="${ROOT_DIR}/word"
BIB="${LATEX_DIR}/bibliography/nexus.bib"
MACROS="${SCRIPT_DIR}/pandoc-macros.tex"
REFDOC="${SCRIPT_DIR}/reference.docx"

CHAPTER_TEX="$(ls "${LATEX_DIR}/chapters/${NUM}_"*.tex 2>/dev/null | head -1 || true)"
if [[ -z "${CHAPTER_TEX}" ]]; then
  echo "error: no chapter file matching chapters/${NUM}_*.tex" >&2
  exit 1
fi

BASENAME="$(basename "${CHAPTER_TEX}" .tex)"
OUT="${WORD_DIR}/${BASENAME}.docx"
mkdir -p "${WORD_DIR}"

# Human-readable chapter title for the Word title page.
TITLE="$(grep -m1 -oE '\\chapter\{[^}]*\}' "${CHAPTER_TEX}" | sed -E 's/\\chapter\{(.*)\}/\1/')"
[[ -z "${TITLE}" ]] && TITLE="Chapter ${1}"

echo "[chapter_to_word] ${CHAPTER_TEX}"
echo "[chapter_to_word]   -> ${OUT}"

# Prepend the pandoc-friendly macro definitions so custom commands
# (\nexusfigure, \PSA, ...) expand into structures pandoc can render.
TMP="$(mktemp -t nexus_ch_XXXX.tex)"
trap 'rm -f "${TMP}"' EXIT
cat "${MACROS}" "${CHAPTER_TEX}" > "${TMP}"

REF_ARG=()
[[ -f "${REFDOC}" ]] && REF_ARG=(--reference-doc="${REFDOC}")

pandoc "${TMP}" \
  --from=latex \
  --to=docx \
  --citeproc \
  --bibliography="${BIB}" \
  --metadata title="Chapter ${1}: ${TITLE}" \
  --metadata reference-section-title="References" \
  --resource-path="${LATEX_DIR}:${LATEX_DIR}/figures" \
  --number-sections \
  "${REF_ARG[@]}" \
  --output="${OUT}"

echo "[chapter_to_word] done -> ${OUT}"
