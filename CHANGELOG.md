# Changelog — NEXUS Thesis Writing Workspace

Running log of changes to `Thesis_final/Writing/`. Each entry records
WHAT changed, WHY, and WHERE.

---

## 2026-05-21 — Writing workspace setup + Chapter 3 first draft

**WHAT.** Created the `Writing/` workspace: LaTeX template, build
scripts, pandoc Word-generation pipeline, and the first draft of
Chapter 3 (NEXUS Architecture, ~26 PDF pages, ~10,400 words).

**WHY.** Start of the thesis writing phase. Chapter 3 is drafted first
because the architecture is the most stable part of the project
(`Context/THESIS_PLAN_2026-05-20.md`, chapter drafting order).

**WHERE.**
- `latex/preamble.tex` — generic academic template: `report` 12pt A4,
  `newtx` (Times-like) font, 1.5 spacing, 2.5cm margins, `biblatex`+
  `biber` IEEE-numeric, `listings`, `siunitx`, `booktabs`, `\nexusfigure`
  placeholder macro. (PoliTo publishes no official LaTeX MSc class.)
- `latex/main.tex` — master document: title page, front matter,
  `\include` of all 7 chapters, `\printbibliography`.
- `latex/chapters/03_architecture.tex` — first draft. Sections 3.1–3.8
  (introduction, architectural overview, Worker layer, Marketplace
  layer, Fence layer, School layer, ISA-95 mapping & privacy,
  implementation architecture). Source: `nexus-mvv-v5/DESIGN_DECISIONS.md`
  (DD-V5-001..022), `docs/NARRATIVE_ARC_v5.md`,
  `docs/AGENT_CONSTRAINT_DERIVATION.md`, `src/`.
- `latex/chapters/0{1,2,4,5,6,7}_*.tex` — placeholder stubs so the full
  document compiles and cross-references resolve.
- `scripts/build_latex.sh`, `chapter_to_word.sh`, `build_all.sh` — build
  pipeline. `scripts/reference.docx` — Word style template patched to
  Calibri 11pt / 1.5 line spacing. `scripts/pandoc-macros.tex` — pandoc
  redefinitions of custom macros.
- `latex/bibliography/nexus.bib` — symlink to `../../../Bibliography/nexus.bib`
  (read-only; not modified).
- `README.md` — workflow documentation.

**Build status.** LaTeX compiles cleanly (40 pages, 0 undefined
citations, 0 undefined references, 2 negligible overfull hboxes ≤7pt).
Word generated: `word/03_architecture.docx` (no LaTeX artifacts).

**Open items / to verify with supervisor.**
- Test-suite count: the chapter cites "more than 240 tests". The setup
  brief states 245; `nexus-mvv-v5/THESIS_STATE.md` states 230 (claim 2)
  and the 2026-05-20 plan states 230. The precise figure should be
  reconciled when Chapter 4 (Implementation) is drafted.
- A* citation: the admissible-heuristic discussion names Hart, Nilsson &
  Raphael's A* algorithm in prose without `\cite`, because no Hart 1968
  entry exists in `nexus.bib` (which is read-only for this workspace).
  Add the entry to `nexus.bib` and insert the citation when convenient.
- Figures are placeholders (`\nexusfigure`); real figures to be
  generated in a later phase and dropped into `latex/figures/`.
