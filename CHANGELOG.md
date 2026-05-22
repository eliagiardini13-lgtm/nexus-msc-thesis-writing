# Changelog — NEXUS Thesis Writing Workspace

Running log of changes to `Thesis_final/Writing/`. Each entry records
WHAT changed, WHY, and WHERE.

---

## 2026-05-22 — Chapter 3: TikZ figures + fixes + polish

**WHAT.** Replaced the 5 figure placeholders with native TikZ diagrams,
added 3 further diagrams (8 figures total), and applied four content
fixes. Chapter 3 is now ~28 PDF pages.

**WHY.** The first draft used framed-box placeholders. The architecture
chapter needs real diagrams; TikZ keeps them native (vector, no external
image assets) and editable in the LaTeX source.

**WHERE.**
- `latex/tikz-setup.tex` (new) — shared TikZ libraries, colour palette,
  styles; input by `preamble.tex` and by the figure renderer.
- `latex/figures/fig_*.tex` (8 new) — `fig_isa95` (ISA-95 levels +
  NEXUS at L3), `fig_arch_layers` (4-layer architecture), `fig_arch_bdi`
  (Worker BDI internals), `fig_arch_flow` (negotiation sequence),
  `fig_arch_mediator` (branch-cut A* search tree), `fig_arch_fence`
  (3-tier classification), `fig_infoflow` (information flow + privacy
  boundaries), `fig_lifecycle` (end-to-end decision lifecycle).
- `latex/preamble.tex` — input `tikz-setup`; new `\nexustikzfigure`
  macro (adjustbox-scaled TikZ inclusion).
- `latex/chapters/03_architecture.tex` — 5 placeholders -> TikZ; 3 new
  figures placed in 3.1, 3.7, 3.8.
- `scripts/render_figures.sh` (new) — rasterises each TikZ figure to PNG
  via a standalone wrapper, for the Word pipeline.
- `scripts/chapter_to_word.sh` — now renders figures before pandoc;
  `scripts/pandoc-macros.tex` — `\nexustikzfigure` -> `\includegraphics`.
- `.gitignore` — ignore `latex/figures/*.png` and `*.pdf`.

**Fixes.**
1. Test count: "more than 240" -> "245" (Section 3.8).
2. A* attribution: prose reference to Hart, Nilsson & Raphael kept; a
   `% TODO` marks where `\cite{hart1968astar}` goes once the entry is
   added to `nexus.bib` (bibliography not modified, per task constraint).
3. Industrial-benchmark forward reference added to Section 3.4 (after
   the paradigm table) and Section 3.8 — points to the Chapter 5
   coordination comparison and the industrial automotive benchmark.
   DD-V5-021/022 kept in LaTeX comments, not in reader-facing prose.
4. Mechanism-limitations paragraph added to Section 3.8: the conflict
   announcement carries domain-local signals only; cross-functional
   context (job priority, product variant, budget state) is absent and
   is a mechanism-awareness extension (future work, Chapter 7).

**Build status.** LaTeX clean (42 pages, 0 undefined citations/refs,
2 negligible overfull hboxes < 7pt). Word regenerated:
`word/03_architecture.docx` with all 8 figures embedded as PNG.

**Still deferred.** Hart 1968 A* citation (awaiting a `nexus.bib`
entry); test count 245 follows the setup brief — `THESIS_STATE.md`
still records 230 and should be reconciled when Chapter 4 is drafted.

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
