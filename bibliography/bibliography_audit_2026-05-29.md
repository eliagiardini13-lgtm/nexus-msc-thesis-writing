# Bibliography Audit — 2026-05-29

**Purpose:** Map every entry in `nexus.bib` to its expected chapter destination. Built during the consistency-pass session on 2026-05-29, after Ch3+Ch5 cross-chapter audit. The bibliographic cleanup itself is deferred to end-of-thesis (after Ch1, Ch2, Ch4, Ch6, Ch7 are drafted), when `biber --validate` can identify uncited entries with certainty.

**Total entries audited:** 106 (27 already cited in Ch3+Ch5; 79 audited here).

---

## Already cited (no action needed) — 27 entries

Cited in Ch3 and/or Ch5. Coverage of core literature on negotiation, mediator, A*, BDI, ISA-95, privacy, holonic architectures.

`alshiekh2017`, `deb2014nsga3`, `decker1995gpgp`, `deen1997cnp`, `faratin1998negotiation`, `fatima2004multiissue`, `fioretto2018dcop`, `hart1968astar`, `hattori2007narrowing`, `isa95part1`, `ito2007multiissue`, `kirkpatrick2017`, `klein2003negotiating`, `konighofer2019shields`, `leitao2007holonic`, `leitao2009survey`, `leitao2015hapba`, `modi2005adopt`, `monostori2006`, `rahwan2003argumentation`, `raju2020runtime`, `rao1995bdi`, `smith1980`, `sprock2019isa95`, `trentesaux2009`, `vanbrussel1998prosa`, `wooldridge1995`

---

## To remove — 8 entries

These are confirmed unused / superseded / duplicate. Remove at final cleanup pass.

| Entry | Reason |
|---|---|
| `taillard1993` | Alternative benchmark, never used in thesis |
| `leitao2020cps` | Duplicate of `leitao2020` |
| `zheng2017cps` | CPS framing not central to thesis (NEXUS is L3 software, not a CPS itself) |
| `tao2019` | Digital twin not central to thesis |
| `monteAlto2024` | Not recognizable / not used |
| `zhao2024llmmas` | Duplicate of `lim2024llm` |
| `laggoune2015crew` | Crew scheduling not in thesis scope |
| `leukel2021condition` | Superseded by `rahmati2018cbm` (more established, 2018 vs 2021) |

---

## Decide at end of thesis — 9 entries

These entries are kept as "available options" until the relevant chapter is drafted. Final decision at end-of-thesis `biber --validate` pass.

| Entry | Potential use |
|---|---|
| `garey1976nphard` | Ch2 if NP-hardness is discussed; else remove |
| `hooker1995testing` | Ch2 or Ch5 (methodology); unclear |
| `safra2024wiring` | §5.8.3 safety alternatives; verify when drafting |
| ~~`sargent2013verification`~~ | moved to Ch4 confirmed (2026-05-29) |
| `parasuraman2000` | Ch7 adjustable autonomy / human factors; verify |
| `agarwal2021precipice` | Unclear use; verify |
| `dacol2022cp` | Ch2 constraint programming methodology; verify |
| `rocha2017` | Unknown; verify |
| `rehman2021` | Unknown; verify |
| `elsayed2021` | Unknown; verify |

---

## To keep — destination by chapter

### Chapter 1 — Introduction (2 entries)

`pinedo2016scheduling` (also Ch2), `shoham2009mas` (also Ch2)

### Chapter 2 — Literature Review (~50 entries)

#### FJSP foundations and benchmarks

`brandimarte1993` (also Ch5), `hurink1994fjsp`, `behnke2012fjsp`, `fattahi2007fjsp`, `dauzere2024fjspreview`, `pinedo2016scheduling` (also Ch1)

#### MAS foundations + negotiation

`rosenschein1994`, `kraus1993`, `wooldridge1995` (also Ch3), `shoham2009mas` (also Ch1), `sycara1998mas`, `shen2006mas`, `panait2005cooperative` (also §5.8.3), `wong2006negotiation`, `kim1999multicontract`, `desilva2020bdi`

#### Industrial coordination + Industry 4.0 / smart manufacturing

`hirsch2021`, `leitao2020`, `pulikottil2023`, `didden2024`, `wagner2023`, `derigent2020`

#### MAS in manufacturing — implementation alternatives (also §5.8.3)

`li2024marl`, `zhang2024marl_semiconductor`, `zhang2023camarl`, `lim2024llm`, `liu2024auction`, `bichler2000multiattribute`, `david2002multiattribute`, `dias2006marketbased`, `koo2021squad`, `lauer2000distributed`, `okimoto2013modcop`, `camisa2020nashbargaining`

#### FJSP + PM / maintenance literature

`moradi2011fjsppm`, `wocker2024fjsppm`, `hernandez2018deteriorating`

#### Recent papers — gap characterization

`cemri2025`, `farahani2025`, `hu2026`, `fauzi2026multiobjective`, `gahm2026rig`

#### Dynamic scheduling + multi-objective

`deb2002nsga2`, `luo2022dfjsp`, `xiao2023dynamic`, `berrichi2022dynamic`, `ma2015multiobjective`, `gandomi2022scheduling`

#### Reliability / cascade

`nourelfath2016cascade`

#### Methodology

`smithmiles2022isa` (instance space analysis — TODO: verify utility when drafting Ch2)

#### Supply chain context

`dolgui2018ripple` (also possibly Ch6)

### Chapter 3 — Architecture

Coverage already complete (27 cited entries, see top).

### Chapter 4 — Implementation (2 entries — both cited 2026-05-29)

`law2000simulation` — simulation modeling foundation (justifying SimPy choice); cited in §Simulation Framework.
`sargent2013verification` — simulation-model verification & validation methodology; cited in §Determinism and reproducibility. (Moved here from "Decide at end" on 2026-05-29.)

### Chapter 5 — §5.8.3 Implementation alternatives (citations to add)

Currently §5.8.3 enumerates alternatives without citing literature. Add at next consistency pass:

**Worker layer alternatives:**
- MARL: `li2024marl`, `zhang2024marl_semiconductor`, `zhang2023camarl`, `panait2005cooperative`
- LLM: `lim2024llm`
- Game-theoretic: `camisa2020nashbargaining`

**Marketplace alternatives:**
- Combinatorial auction: `liu2024auction`, `bichler2000multiattribute`, `david2002multiattribute`, `dias2006marketbased`
- Distributed coord: `koo2021squad`, `lauer2000distributed`
- DCOP variants: `okimoto2013modcop` (extends `modi2005adopt`, `fioretto2018dcop` already cited)

**Fence layer alternatives:**
- Runtime enforcement: already covered by `alshiekh2017`, `konighofer2019shields`, `raju2020runtime`
- Formal verification: `ames2019cbf`, `safra2024wiring` (TBD), `massouh2024safe`

**School layer alternatives:**
- EWC: `kirkpatrick2017` (already cited)
- Online RL: `achiam2017cpo`, `hayes2022morl`

### Chapter 6 — Industrial case study (5-7 entries)

`kumar2018integrated` (anchor paper, AVTEC powertrain), `bachhav2025mes`, `dolgui2018ripple`, `xia2021cbm_spares`, `molenaers2012criticality`, `syntetos2023spares` (probable), `rahmati2018cbm`

### Chapter 7 — Conclusions / future work (4 entries probable)

`achiam2017cpo`, `ames2019cbf`, `massouh2024safe`, `hayes2022morl` (safety + RL future-work pointers)

---

## Notes for end-of-thesis cleanup

1. Run `biber --validate` to confirm "to remove" + "decide at end" lists.
2. Verify `smithmiles2022isa` actual utility for Ch2 instance space discussion.
3. Verify `xia2021cbm_spares` vs `rahmati2018cbm` selection for Ch6.
4. Check whether §5.8.3 citations actually landed in Ch5 update.

End of audit document.
