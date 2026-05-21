# NEXUS Thesis — Writing Workspace

LaTeX sources, build scripts, and generated Word documents for the MSc
thesis *NEXUS — Negotiation-driven EXecution and Unified Synchronization:
A Reference Architecture for Cross-Functional Coordination in
Manufacturing Operations Management at ISA-95 Level 3*.

- **Author:** Elia Giardini
- **Program:** M.Sc. Industrial Production Engineering — Politecnico di
  Torino / Beihang University (double degree)
- **Supervisors:** Prof. Li Yi (Beihang), Prof. Alessandro Simeone (PoliTo)
- **Defense target:** October–November 2026

This directory is an isolated writing workspace. It does **not** modify
`Simulations/Code/`, `Bibliography/`, or `Context/` — it only reads the
bibliography (via a symlink) and the design documents under
`Simulations/Code/nexus-mvv-v5/`.

---

## Directory layout

```
Writing/
├── latex/
│   ├── main.tex              master document (title page, front matter,
│   │                         chapter includes, bibliography)
│   ├── preamble.tex          packages, fonts, formatting, biblatex setup
│   ├── chapters/
│   │   ├── 01_introduction.tex   stub  (drafting: Week 8)
│   │   ├── 02_literature.tex     stub  (drafting: Week 6)
│   │   ├── 03_architecture.tex   FIRST DRAFT — NEXUS architecture
│   │   ├── 04_implementation.tex stub  (drafting: Week 8)
│   │   ├── 05_results.tex        stub  (drafting: Week 9)
│   │   ├── 06_industrial.tex     stub  (drafting: Week 9-10)
│   │   └── 07_conclusions.tex    stub  (drafting: Week 11)
│   ├── figures/              generated figures (placeholders for now)
│   ├── bibliography/
│   │   └── nexus.bib  ->  ../../../Bibliography/nexus.bib   (symlink)
│   └── main.pdf              compiled output (generated)
├── word/                     pandoc-generated .docx per chapter (generated)
├── scripts/
│   ├── build_latex.sh        compile the full thesis to PDF
│   ├── chapter_to_word.sh    convert one chapter LaTeX -> Word
│   ├── build_all.sh          all chapters to Word + full thesis PDF
│   ├── pandoc-macros.tex     pandoc-friendly macro definitions
│   └── reference.docx        Word style template (Calibri 11pt, 1.5 spacing)
├── README.md                 this file
└── CHANGELOG.md              running change log (WHAT / WHY / WHERE)
```

---

## Toolchain

| Tool      | Purpose                          | Notes                         |
|-----------|----------------------------------|-------------------------------|
| `pdflatex`| LaTeX compilation                | via TeX Live                  |
| `biber`   | bibliography backend             | driven automatically by latexmk |
| `latexmk` | build orchestration              | runs pdflatex + biber in order|
| `pandoc`  | LaTeX → Word conversion          | 3.x; install with `brew install pandoc` |

The LaTeX build is self-contained: it uses `listings` (not `minted`) for
code, so no `-shell-escape` and no external Pygments install is required.

### LaTeX template

Politecnico di Torino does not publish an official LaTeX class for the
MSc thesis (it distributes Word templates only). `preamble.tex` is a
clean generic academic template configured to the project formatting
brief: `report` class, 12 pt, A4, a Times New Roman–like font (`newtx`),
1.5 line spacing, 2.5 cm margins, and IEEE-numeric citations via
`biblatex` + `biber`. The community `toptesi` CTAN package is an
alternative if an official PoliTo look is later required.

---

## Workflow

### 1. Compile the full thesis to PDF

```bash
scripts/build_latex.sh
```

Output: `latex/main.pdf`. Chapters not under active work can be
commented out in `main.tex` to speed up compilation (cross-references
to commented chapters will then render as `??`).

### 2. Convert a single chapter to Word

```bash
scripts/chapter_to_word.sh 3        # -> word/03_architecture.docx
```

The chapter is converted with `pandoc`: citations are resolved against
`nexus.bib` and rendered author–year (CSL), a chapter title is added,
and a `References` section is appended at the end of the chapter. The
Word body style is Calibri 11 pt with 1.5 line spacing (from
`scripts/reference.docx`).

### 3. Full build (all chapters to Word + thesis PDF)

```bash
scripts/build_all.sh
```

### Per-chapter review loop

1. Draft / revise a chapter in `latex/chapters/NN_*.tex`.
2. `scripts/chapter_to_word.sh NN` → review the `.docx` (with Prof. Li Yi).
3. Apply feedback to the LaTeX source; regenerate. The LaTeX source is
   the single source of truth — never edit the generated `.docx`.

---

## Chapter drafting order

Chapters are drafted in dependency order, not numerical order (the
architecture is the most stable, the introduction depends on final
results). Per `Context/THESIS_PLAN_2026-05-20.md`:

| Order | Chapter | Status        | Planned |
|-------|---------|---------------|---------|
| 1 | 3 — Architecture          | **first draft done** | — |
| 2 | 2 — Literature Review     | stub | Week 6  |
| 3 | 1 — Introduction          | stub | Week 8  |
| 4 | 4 — Implementation        | stub | Week 8  |
| 5 | 5 — Results               | stub | Week 9  |
| 6 | 6 — Industrial Case Study | stub | Week 9-10 |
| 7 | 7 — Conclusions           | stub | Week 11 |

---

## Conventions

- **Citations** use `\cite{key}` against `nexus.bib`. Only keys already
  present in `nexus.bib` are cited — the bibliography file is read-only
  for this workspace.
- **Figures** are placeholders for now: the `\nexusfigure{label}{caption}
  {description}` macro renders a framed box and keeps the caption, label,
  and cross-references valid in both PDF and Word. Real figures drop into
  `latex/figures/` in a later phase.
- **Cross-references** are written as plain `Figure~\ref{...}`,
  `Section~\ref{...}`, `Table~\ref{...}` (no `cleveref`/`autoref`), so
  they survive the pandoc conversion to Word.
