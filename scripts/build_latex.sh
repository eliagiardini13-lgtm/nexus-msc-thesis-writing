#!/usr/bin/env bash
# ============================================================
#  build_latex.sh — compile the full thesis to PDF.
#
#  Runs latexmk, which drives pdflatex + biber automatically
#  (biber is auto-detected from the biblatex setup in preamble.tex).
#
#  Usage:  scripts/build_latex.sh
#  Output: latex/main.pdf
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LATEX_DIR="$(cd "${SCRIPT_DIR}/../latex" && pwd)"

echo "[build_latex] compiling main.tex in ${LATEX_DIR}"
cd "${LATEX_DIR}"

latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex

echo "[build_latex] done -> ${LATEX_DIR}/main.pdf"
