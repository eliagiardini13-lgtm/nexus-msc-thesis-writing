# Chapter 5 §5.9 — Applicability Boundary & Discussion: working notes

**Date:** 2026-05-26
**Source:** Working session between Elia and Claude (NEXUS Thesis project)
**Status:** Draft thinking — not yet prose. Structure and reasoning to be carried into actual §5.9 writing.

---

## What §5.9 does in the chapter's design

§5.1–§5.8 are all positive evidence: each section delivers one architectural property
(coordination over independence, compositional emergence, order independence, σ-tier
governance, bounded disclosure, centralized alignment, joint mediation signature).
When the reader arrives at §5.9, they have been exposed to seven sections each saying
"NEXUS does X, here is the evidence."

§5.9 is where you **stop selling and become honest**. It discusses where the framing
applies, where it doesn't, and what remains open.

This serves three purposes:

1. **Defuses critique before it is raised.** A reviewer thinking "but what about
   outcome performance?" gets an answer before it becomes an objection.
2. **Sets up Chapter 6.** If Chapter 6 is industrial scenario or expanded future
   work, §5.9 says "these are the boundaries of the current work that justify
   Chapter 6."
3. **Demonstrates methodological maturity.** A chapter closing with "everything works
   perfectly" is suspect. One closing with "here are the real boundaries of the
   claim" is scientifically serious.

---

## The four motivations Elia gave for outcome parity (HB1/HF3)

Reorganized by level — they operate on different levels, so they need to be separated
rather than mixed in a single paragraph (mixing them sounds defensive, separating them
sounds analytical).

### Level 1 — Benchmark properties
Brandimarte has known structure in the literature; synth v2 also (despite being FJSP).
Outcome parity is partly an effect of the problem class — FJSP is well studied, optima
are close together, the distance between approaches compresses.

### Level 2 — Single-metric inadequacy
Throughput/makespan/defects are scalars that underestimate a multi-objective
architecture by construction. They hold "up to a point" — but that point is:
a multi-criteria system evaluated on a single scalar metric loses the information
that makes it interesting. It is not "up to a point", it is **structurally incomplete**.

### Level 3 — Reference architecture is implementation-agnostic
What NEXUS demonstrates is that the 4-layer decomposition + interfaces + structural
properties (joint mediation, σ-tier, bounded disclosure) hold. The specific
implementation (BDI workers, A* mediator, etc.) is one point in the design space.
The outcome of that specific implementation is not the thesis claim — the claim is
that the architecture supports a family of implementations of which this is one.

### Level 4 — Industrial case as next step
Outcome dominance would require contexts where single-metric outcome dominance is
genuinely important. An industrial case scenario is the setting where that question
becomes measurable.

---

## Why separating them matters

If you mix them in a single paragraph, it sounds like stacked excuses
("doesn't outperform because benchmark + because wrong metrics + because architecture
+ because no industrial case"). Sounds defensive.

If you separate them into distinct paragraphs each recognizing different things,
each holds on its own as an argument. Sounds analytical.

---

## The rhetorical order matters too

There is a rhetorical order that works better than another.

The chronological order Elia originally used (benchmark → metrics → architecture →
future) is **weak** because it opens with the most contestable point (benchmark).

The order **architectural reframing first, limitations after** works better:

1. **Reference architecture is implementation-agnostic** (Level 3)
   → redefines what the thesis is demonstrating
2. **Single-metric inadequacy** (Level 2)
   → explains why outcome metric is not the right lens
3. **Benchmark properties** (Level 1)
   → further contextualizes
4. **Industrial case as next step** (Level 4)
   → bridge to Chapter 6

In this order, §5.9 doesn't defend itself; it constructs the framing of its own claim
and then points where to go beyond.

---

## Draft skeleton for §5.9 (paragraph-level)

Not prose yet — structure with the claim of each.

### §5.9.1 — The architectural claim revisited

Reopens the reference-architecture framing (recalling §5.1). The thesis claim is not
"this specific NEXUS implementation outperforms baselines on outcome metrics" but
"this implementation instantiates one point in the design space defined by the
reference architecture, and the architectural properties (P-α..P-θ) hold for this
point". The value of the thesis is in the reference architecture as a framework,
not in outcome claims of one of its implementations.

### §5.9.2 — Outcome characterization in this study

Here you honestly present outcome parity (HB1/HF3) as an empirical contextual
finding. Half a page. Something like:

> "When evaluated on outcome metrics (throughput, makespan, defect rate), NEXUS
> achieves parity with the distributed baseline Siloed-v5-native across all eight
> cells. This is consistent with three considerations: (1) the reference architecture
> targets structural properties rather than outcome dominance; (2) scalar outcome
> metrics are structurally incomplete representations of multi-criteria coordination;
> (3) the FJSP benchmark family explores a regime where coordination approaches
> converge to similar outcome levels by problem-class properties."

Here you cite HB1/HF3 honestly, **once**, contextualizing them. You don't hide them.
You don't put them under the spotlight. You archive them as "context for the
architectural claim".

### §5.9.3 — Implementation alternatives within the reference architecture

Here you expand Level 3. The reference architecture supports:

- **Workers:** BDI (chosen) | MARL | LLM-based negotiation | game-theoretic
- **Marketplace:** Multi-issue A* (chosen) | combinatorial auction | DCOP | argumentation
- **Fence:** log-only (chosen) | runtime policy enforcement | formal verification
- **School:** placeholder (chosen) | EWC | RAG | online RL

Each of these is a point in the design space. Outcome metrics could change
significantly between different points. Future research direction includes mapping
the design space empirically.

This section is important because:
- It demonstrates you understand the meaning of "reference architecture" (not just
  rhetorical name)
- It opens future work / paper / industrial collaboration without promising anything
- It implicitly answers "but could you do better with [other technique]?" — yes,
  and the architecture supports it

### §5.9.4 — Limitations

Brief honest list:
- Fence runtime enforcement (declared scope, future work)
- School continual learning (placeholder, future work)
- Benchmark coverage (FJSP family, industrial deployment not validated)
- Single-step coordination horizon (multi-step planning not addressed)
- Etc.

One line per limitation. No drama.

### §5.9.5 — Toward industrial validation

Bridge to Chapter 6. If Chapter 6 is industrial case scenario, you anticipate its
justification here. If Chapter 6 is something else, this paragraph becomes "future
work for industrial deployment".

Something like:

> "The validation in this chapter establishes architectural properties on benchmark
> datasets. Industrial deployment validation, where outcome metrics may behave
> differently and where architectural properties such as auditability and adjustable
> autonomy demonstrate operational value, is treated in Chapter 6 [or: is identified
> as future work]."

---

## Open questions to revisit during writing

1. **Sequential commitment-asymmetry finding** — currently TBD. The original Phase 11
   outline §5.10 mentioned it. Elia doesn't remember the details without going back
   to documents. If it's not in his head, it's probably not central to §5.9 — central
   things stay in memory. Decision: placeholder, recover from `WHY_NO_JOINT_ADVANTAGE`
   or Sequential diagnostic documents when writing if it adds substance, otherwise
   drop.

2. **§5.9.3 standalone or merged with §5.9.1?** Both are about reframing. Could be
   combined. Decision pending — depends on density when actually writing.

3. **Chapter 6 status** — at writing time, decide if §5.9.5 says "treated in
   Chapter 6" or "identified as future work". Affects framing.

---

## Connection to overall Chapter 5 structure (9 sections, post §5.8 deletion)

- 5.1 methodology (intro framing + 4 evidence families)
- 5.2 coordination over independence (F1) — with cross-codebase caveat
- 5.3 compositional trade-off emergence (F6/F7)
- 5.4 order-invariant decisions (F8)
- 5.5 risk-tier governance signature (HA1 + σ-tier table)
- 5.6 bounded information sharing (HF2 + Phase C)
- 5.7 centralized alignment (HF1)
- 5.8 joint mediation signature (Phase D 10pp gap)
- **5.9 applicability boundary + discussion** ← this document
