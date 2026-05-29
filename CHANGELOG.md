# Changelog — NEXUS Thesis Writing Workspace

Running log of changes to `Thesis_final/Writing/`. Each entry records
WHAT changed, WHY, and WHERE.

---

## 2026-05-29 — Cross-chapter consistency fixes (Ch3 ↔ Ch5)

**WHAT.** Three fixes closing textual gaps between Chapter 3's
architectural promises and Chapter 5's property-validation claims,
surfaced by a cross-chapter audit.

**WHY.** Chapter 5 validates properties P7 (compositional emergence)
and P8 (order invariance) that Chapter 3 implied but did not state
explicitly; and Table 5.1's P7 row cited a Chapter 4 label as a
Chapter 3 promise location.

**WHERE.**
- `latex/chapters/03_architecture.tex` — §3.4 (\texttt{subsec:mediator}):
  new paragraph stating compositional emergence as a property of the
  admissible A* composition (P7 anchor, +106 words). §3.4
  (\texttt{subsec:protocol-scope}): new paragraph stating order
  invariance as a structural consequence of the single-round protocol
  (P8 anchor, +91 words). Both forward-reference Chapter~5.
- `latex/chapters/05_results.tex` — Table 5.1 P7 row: removed the
  incorrect `sec:impl-baselines` (Chapter 4) reference, leaving the
  Chapter 3 promise as `subsec:mediator` only.

**Build status.** LaTeX clean (106 pages; 0 undefined refs, 0
multiply-defined labels, 0 errors). Dated review exports regenerated:
`word/{03_architecture,05_results}_2026-05-29.{docx,pdf}`; the
`05_results_2026-05-27.*` exports are kept for diff comparison.

---

## 2026-05-27/28 — Chapter 5 (Validation) drafted in full

**WHAT.** Drafted Chapter 5 end to end: methodology (§5.1) plus seven
property-validation sections (§5.2–§5.7) and the applicability-boundary
discussion (§5.8 with five sub-sections). ~14,000 words, 37 PDF pages,
7 TikZ figures, 9 tables.

**WHY.** Chapter 5 is the empirical core of the thesis, framed as
architectural validation (not outcome dominance) per DD-034.

**WHERE.**
- `latex/chapters/05_results.tex` — full chapter. §5.1 methodology with
  the thesis-facing test-label glossary (OD/AL/DI/PR/σG/OI/CE/JM,
  Table 5.3); §5.2 compositional emergence (CE); §5.3 order invariance
  (OI); §5.4 σ-tier governance (σG); §5.5 bounded disclosure (DI);
  §5.6 centralised alignment (AL); §5.7 joint mediation (JM); §5.8
  applicability boundary (architectural claim, outcome characterisation
  absorbing the OD/PR verdicts, design-space alternatives, limitations,
  bridge to Chapter 6).
- `latex/figures/fig_val_{stack,emergence,order,sigma,tradeoff,alignment,matrix}.tex`
  — 7 new TikZ figures.
- `latex/bibliography/nexus.bib` — bibliography updated (hart1968astar +
  industrial-FJSP references); the activated `\cite{hart1968astar}` in
  Chapter 3 depends on it.
- `.gitignore` — also ignore `word/*.pdf` (generated review exports).

**Refactor (this batch).** Eliminated the standalone outcome-dominance
§5.2; renumbered §5.3–§5.9 → §5.2–§5.8; moved the outcome-parity
discussion into §5.8.2; introduced the descriptive test labels in place
of the internal H-codes.

**Build status.** LaTeX clean (105 pages; 0 undefined refs, 0
multiply-defined labels, 0 errors). Consistency verified: no internal
codes (H-codes, Phase A–F, Step 1, DD-V5-NNN) leak into prose outside
the glossary and the one §5.1.3 explanatory note. Review exports
regenerated to `word/05_results_2026-05-27.{docx,pdf}` (git-ignored).

---

## 2026-05-26 — Test-count reconciliation across Chapters 3 and 4 (generic formulation)

**WHAT.** Replaced all specific test-count numbers in Chapters 3 and 4
with a future-proof generic formulation ("~$350$ tests at the time of
writing"). Affected citations:
- Ch.3 §3.8 (line 1396): "$307$ tests across $26$ files" → "approximately
  $350$ tests at the time of writing".
- Ch.4 §4 Testing Strategy (line 1142): "$350$ tests ($349$ PASS, $1$
  SKIP)" → "approximately $350$ tests at the time of writing".
- Ch.4 (line 1162): "350-test budget" → "test budget".
- Ch.4 chapter close (line 1254): "test suite of $350$ tests" → "test
  suite (~$350$ tests at the time of writing; ...)".

**WHY.** Pre-existing inconsistency across the manuscript: Chapter 3
cited "307 tests" (snapshot at 2026-05-23), Chapter 4 cited "350 tests"
(snapshot at Chapter 4 drafting on 2026-05-26), code repo HEAD is
$349$ PASS + $1$ SKIP. Three different numbers for the same artifact
across two chapters and the code state. Resolution chosen: stop
re-counting in prose entirely. The suite continues to grow as Chapter 5
validation work proceeds, so any hard number will go stale again
within weeks. Generic formulation defers to `DESIGN_DECISIONS.md` and
the `pytest` output as the single source of truth.

**WHERE.**
- `latex/chapters/03_architecture.tex` line 1396.
- `latex/chapters/04_implementation.tex` lines 1142, 1162, 1254.
- LaTeX recompiled cleanly: 68 pages, 0 errors, 0 warnings, 0
  undefined references.

---

## 2026-05-23 — Chapter 3 test-count reconciliation; A* citation verified

**WHAT.** Reconciled the Chapter 3 test-count discrepancy flagged by the
[THESIS_STATUS_AUDIT](../THESIS_STATUS_AUDIT.md) (Chapter 3 cited "245",
repo carries 307 across 26 files). Verified that the
Hart-Nilsson-Raphael (1968) A* bibentry is already in `nexus.bib`
(`@article{hart1968astar, …}`, IEEE Trans. SSC 4(2), 100–107) and that
`\cite{hart1968astar}` is in place in §3.4.4 — both added in the
2026-05-22 batch; the audit-listed open item was stale.

**WHY.** Trivial accuracy fix: the suite grew (DD-V5-019 synthetic v2
agents/env/generator + DD-V5-022 industrial automotive + DD-V5-023
extensions + DD-V5-025 industrial v2 added ~62 tests after the
Chapter 3 first draft fixed the count at 245). Audit-listed open
items both resolved.

**WHERE.**
- `latex/chapters/03_architecture.tex` (§3.8) — "$245$ tests" →
  "$307$ tests across $26$ files".
- `../Bibliography/nexus.bib` — no change required; `hart1968astar`
  already present at line 1022, cited from §3.4.4 line 795.

---

## 2026-05-26 — Chapter 4 (Implementation): first draft

**WHAT.** First draft of Chapter 4 written from zero: 8 sections,
~25 PDF pages, 8 native TikZ figures, 8 code listings.

**WHY.** Per the drafting brief: Chapter 4 bridges Chapter 3
(architecture) and Chapter 5 (results) by documenting how the
architecture is realised as a runnable system; the chapter has been
empty since the placeholder stub.

**WHERE.**
- `latex/chapters/04_implementation.tex` (new content) — full draft:
  - 4.1 Overview (package-to-layer mapping, dependencies, determinism)
  - 4.2 Worker Layer (\texttt{AgentV5} base, constraints/bids,
    bid-generation, domain authority, four home agents)
  - 4.3 Marketplace Layer (facade, A* mediator with admissible heuristic,
    remediation hook, contract record / audit instrumentation)
  - 4.4 Fence Layer (rule structure, default suite, audit streams)
  - 4.5 Baselines (Siloed, RBC, CUSO, plus notes on dropped Sequential
    and CNP)
  - 4.6 Benchmark Instances (Brandimarte parser, synthetic generators,
    DD-017 subclass pivot, synthetic-v2 features)
  - 4.7 Simulation Framework (SimPy event loop, plant physics,
    capacity-exhaustion path)
  - 4.8 Testing Strategy (350-test suite organisation, representative
    pattern, determinism substrate)
  DDs surfaced (cited as DD-NNN in prose): DD-005, DD-006, DD-007,
  DD-008, DD-009, DD-010, DD-012, DD-014, DD-017, DD-019, DD-021,
  DD-026, DD-027, DD-030, DD-032, DD-033, DD-034.
- `latex/figures/fig_impl_*.tex` (8 new TikZ files): packages,
  bdi class+pipeline, A* with $f=g+h$, fence audit-stream topology,
  baselines on (joint search, full info) axes, benchmark pipeline,
  SimPy event loop, test-suite tree.
- `latex/tikz-setup.tex` — `\providecommand` for `\NEXUS`, `\PSA`,
  `\PMA`, `\QCA`, `\SCA` so standalone figure renders can use them;
  `latex/preamble.tex` corresponding `\renewcommand`s for prose use.
- Activated the `\cite{hart1968astar}` citation in Chapter 3 (the
  earlier TODO).

**Build status.** LaTeX clean: 68 pages total, Chapter 4 spans pages
31--55 (25 PDF pages); 0 undefined citations, 0 undefined references,
0 multiply-defined labels, 0 \emph{listings} warnings, no
overfull-hbox lines reported. Word regenerated:
`word/04_implementation.docx` (547 KB), all 8 figures embedded as PNG.

**Notes.**
- Page count (25) is below the 30--40 target in the brief; the chapter
  is dense (8 code listings + 8 figures) and was kept tight rather
  than padded with prose.
- Three figure-rendering quirks were resolved while drafting:
  (a) inline `\NEXUS` etc. needed to be provided in `tikz-setup.tex`
  so standalone figure renders compile; (b) `cap` and `step` are
  reserved TikZ keys, so the eventloop and lifecycle figures use
  renamed style keys; (c) the `\S` UTF-8 glyph inside a `lstlisting`
  was replaced by ASCII.
- Listing labels in Chapter 4 use the `lst:impl-*` prefix so they
  don't collide with Chapter 3's `lst:bid` / `lst:mediator`.

---

## 2026-05-22 — Chapter 3 figure resizing + bibliography updates

**WHAT.** Resized the Chapter 3 TikZ figures so they fill the text
width consistently; added 8 references to `nexus.bib`; activated the
Hart 1968 A* citation.

**WHY.** Two figures rendered over-wide (≈19 cm) and were shrunk by the
old `max width` fit, making their text small; others under-filled the
column. The bibliography needed the DD-V5-022/023 industrial-benchmark
references.

**WHERE.**
- `latex/preamble.tex` — `\nexustikzfigure` now scales every figure to
  `width=\linewidth` (was `max width`), so narrow figures enlarge and
  all figures fill the column uniformly.
- `latex/figures/fig_arch_fence.tex` — tier text rewrapped with a fixed
  `text width`; natural width 19.4 cm → 16.5 cm (no more shrink).
- `latex/figures/fig_infoflow.tex` — the bid-summaries arrow no longer
  loops far right; the privacy note moved to the bottom-left with a
  dotted leader; natural width 18.7 cm → 16.0 cm.
- `latex/chapters/03_architecture.tex` — A* attribution now cites
  `\cite{hart1968astar}` (the key is present in `nexus.bib`); the
  earlier TODO comment removed. No prose content changed.
- `../Bibliography/nexus.bib` — 8 entries added (see the Bibliography
  repo changelog / commit); 103 → 111 entries.

**Build status.** LaTeX clean (42 pages, 0 undefined citations,
0 biber errors, 2 negligible overfull hboxes). Word regenerated:
`word/03_architecture.docx`, 8 figures embedded.

**Note on the bibliography.** Of the 8 new entries, 5 are web-verified
(Lei 2022, Han 2021, Azzouz 2017, Wang & Yu 2010, Wang et al. 2020
NSGA-III). 3 could not be located in Crossref / Google Scholar and are
added as `@misc` entries flagged `[UNVERIFIED]` with `TODO` markers:
`nguyen2014maintenancebudget`, `brunetti2016tardiness`,
`forrester2008demand` — confirm or replace before citing. The
`wang2020nsga3fjsp` entry uses a verified Wang et al. (Leiden) paper;
DD-V5-021 had cited the authors as "Wang, M. & Pan, X.", which could
not be verified. The 5 pre-existing entries flagged for a metadata
check (kirkpatrick2017, trentesaux2009, taillard1993,
agarwal2021precipice, brandimarte1993) were verified correct as-is ---
no changes were needed.

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
