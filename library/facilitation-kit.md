# Facilitation Kit — running a playbook engagement

> For a facilitator filling the playbook for one client, with or without the author present.
> The reusable IP lives in the **15 topic pages** (`library/topics/pages/`); the client's copy is an
> **instance** (`instances/<client>/pages/`) where every decision row gets a Choice, a Why, an owner,
> and a status. This kit tells you **what order to decide things in and how to run the room** —
> the **word-for-word script** (all 39 questions, per-archetype default lines, capture targets) is
> [question-guide.md](question-guide.md). Prerequisite: the assessment is done
> ([assessment-kit.md](assessment-kit.md)) — archetype, `domain_maturity` per domain, `sovereignty`
> hypothesis, sponsorship flag, risk flags in hand.

## 1. Quickstart — the model in one page

Five ideas to hold:

- **Archetype** (A1/A2/A3 + regulated overlay, `archetypes.md`) — set by the assessment; **pre-fills
  every decision's default.** Your job is never to decide from blank: present the default, get
  accept / adjust / reject.
- **Modifiers** (`domain_maturity`, `sovereignty`, `criticality` — see `archetypes.md` § Modifiers) —
  three values that fork a default. Each has one setter. Never invent a fourth; never apply one
  before its setter has run.
- **Scope** (page front-matter) — `platform-invariant` (decided once, centrally), `domain-extensible`
  (central baseline each domain extends), `hybrid` (central core + per-domain edge). Scope tells you
  who decides and how many times.
- **Waves & gates** — decisions run in dependency order (§3), not page order. A wave may have an
  **entry gate** (a go/no-go check or a modifier-setter) that must clear before its workshops run.
- **Bundles** — tightly-coupled decisions resolved in one sitting as a set (e.g. tenant topology +
  capacity + networking), not one row at a time.

**Statuses:** `proposed` → `agreed` → `implemented`. Only a human ratifies (see `AGENTS.md`).
**Policy wins:** where a process decision overlaps a policy decision, the policy one is upstream and
wins (§6).

## 2. Crosswalk — decision areas → topic pages

The v0.2 record taxonomy (34 records, clusters A–F) maps onto the 15 pages as follows. Consultants
normally don't need this — each question in the [question-guide](question-guide.md) names its capture
page directly; this table exists for tracing older v0.2 material.

| Cluster | Records | Primary page(s) |
|---|---|---|
| A Strategy | A1 outcomes · A2 data strategy · A4 funding | [01 Strategy](topics/pages/01-strategy.md) |
| | A3 operating model · A5 decision rights | [02 People & Operating Model](topics/pages/02-people-operating-model.md) |
| B People | B1 content ownership · B2 roles/RACI | [02 People & Operating Model](topics/pages/02-people-operating-model.md) |
| | B3 enablement · B4 community/support · B5 change/adoption | [13 Enablement & Adoption](topics/pages/13-enablement-adoption.md) |
| C Governance | C2 domains · governance class system | [03 Governance Classes](topics/pages/03-governance-classes.md) |
| | C1 tenant settings · C3 workspace governance · C5 catalog/endorsement · C7 data quality · F3 certification | [04 Governance](topics/pages/04-governance.md) |
| | C4 security/access · C6 residency/sovereignty | [10 Security & Access](topics/pages/10-security-access.md) |
| D Architecture | D1 tenant topology · D3 landing zone/networking · D4 OneLake layout · D5 workload/experience | [05 Architecture](topics/pages/05-architecture.md) |
| | D6 ingestion | [06 Ingestion](topics/pages/06-ingestion.md) |
| | D7 semantic model/serving | [07 Transformation & Modelling](topics/pages/07-transformation-modelling.md) · [08 Semantic Serving](topics/pages/08-semantic-serving.md) |
| E Engineering | E1 environments · E2 CI/CD · F1 workspace lifecycle · F2 SDLC/intake | [09 Engineering & CI/CD](topics/pages/09-engineering-cicd.md) |
| | E3 naming | [12 Naming Standards](topics/pages/12-naming-standards.md) |
| | E4 monitoring/FinOps · E5 reliability/DR · E6 performance · D2 capacity | [11 Capacity, FinOps & Reliability](topics/pages/11-capacity.md) |
| F Delivery | F4 migration/decommissioning | [14 Roadmap](topics/pages/14-roadmap.md) |

## 3. Wave plan

Indicative for an A2 client with ~3 domains; scale Wave 3 by domain count. Never start a wave before
its predecessor's exit criteria (§7) hold. Wave 3 may start per-domain while Wave 2 cores finish —
but never before the cores those edges extend exist. **In the room, run each session from the
corresponding section of [question-guide.md](question-guide.md)** (Q-numbers below).

| Wave | Sessions | Pages | Gate |
|---|---|---|---|
| **0 Strategy & rights** | S1 strategy/outcomes, Q1–Q4 (2.5h) · S2 decision rights & ownership, Q5–Q6 (2.5h) | 01, 02 (+ assessment confirmation) | **Exit gate: sponsorship.** Weak/uncommitted sponsor → stop and escalate; do not start Wave 1 |
| **1 Foundations** | Gate session, Q7 (2h) · Bundle A platform-foundation, Q8–Q10 (half-day) · Bundle B security-foundation, Q11–Q12 (half-day) | 10 (residency) · 05 + 11-capacity rows · 10 + 04-tenant-settings rows | **Entry gate: residency/sovereignty.** Sets `sovereignty` + approved regions. If `regulated`, downstream defaults auto-tighten — don't re-argue them in the bundles |
| **2 Shared standards** | W2a governance, Q13–Q16 (half-day) · W2b platform standards, Q17–Q21 (half-day) · W2b-FE front-end standards, Q22–Q27 (half-day) · W2c people, Q28–Q31 (half-day) | 2a: 03, 04 · 2b: 05-OneLake, 06, 07, 08, 09, **12 last** · 2b-FE: 07, 08, 09, 10 | naming (12/Q21) is *derived* from domains + capacity + environments — always resolve it last in the wave; run 2b-FE after it |
| | | 2c: 02-RACI rows, 13 | |
| **3 Domain onboarding** | half-day **per domain**, Q32–Q40, repeatable | per-domain edge rows across 04–09, 13 — see [templates/domain-onboarding.md](templates/domain-onboarding.md) | domain's `domain_maturity` confirmed first |
| **4 Operations & lifecycle** | W4a operations, Q41–Q43 (half-day) · W4b delivery lifecycle, Q44–Q45 (half-day) | 4a: 11 (FinOps, DR, performance) · 4b: 09 (intake goes live → `criticality` starts flowing), 14 | conditional: migration track (14/Q45) only if the assessment flagged legacy estate |
| **Consolidate** | ~1 week | README manifest, publish | every row `agreed` or parked with owner + revisit date |

## 4. Exercise library

- **EX-WALK · "React, don't blank"** (per decision row, 5–10 min). Read the question from the
  [question-guide](question-guide.md), show the pre-filled archetype default → 2-min silent read →
  each decision-owner signals accept / adjust / reject → discuss only adjust/reject → capture. Most
  rows should be accepts; that's the point of pre-filling.
- **EX-RATIONALE** (per row, 1 min). Scribe writes the one-sentence Why. No Why → status stays `proposed`.
- **EX-OVERRIDE** (triggered). A rejected default is an override — note it in the Why. **≥2 overrides
  on one page → stop and re-check the archetype**; repeated overrides mean the assessment mis-placed
  the client and the rest of that page's defaults are about to be wrong too. (Per-domain overrides →
  check the domain's `domain_maturity` first, not the org archetype.)
- **EX-PARK** (triggered). Can't resolve in the timebox → status stays `proposed`, assign an owner +
  revisit date in the Why column, move on. Never burn a session forcing consensus.
- **EX-ARBITRATE** (triggered). Stakeholders conflict → the decision-rights authority (page 02)
  decides; unclear → park and flag to the sponsor. Hard timebox: 10 min before escalating.
- **EX-COUPLED-SET** (for bundles). Put the bundle's decisions on one board with dependency arrows;
  decide them together, top of the chain first — not row-by-row.
- **EX-NAMING-ASSEMBLY** (Wave 2b, 30 min). Assemble page 12's grammar live from the already-decided
  domain map, capacity split, and environment topology. Naming is derived — never brainstorm it fresh.

## 5. Capture rules

Capture **live, in the room, by a named scribe — never reconstruct afterwards.** Decisions are
captured **directly in the instance's topic pages** — there is no separate capture sheet.

Every decided row needs five things; missing any one → not done:

| Field | Where |
|---|---|
| Choice | the row's Choice cell |
| Why (one sentence) | the row's Why cell |
| Owner | the page's `owner:` front-matter (or named in the Why if row-specific) |
| Status | `agreed` in the room, `implemented` when built |
| Override noted | in the Why, when the archetype default was rejected |

In the room: read the row → present the default → on agreement the scribe writes it and **reads it
back** before moving on. After each session, commit the pages (PR if the client reviews async).

## 6. Policy vs process (reconciliation)

Three pairs overlap; the governance side owns the **policy**, the delivery/people side owns the
**process applying it**. The process must not contradict the policy — if a default conflicts,
**policy wins**.

| Policy (upstream) | Process (downstream) | Boundary |
|---|---|---|
| Decision rights & bodies (page 02) | Operational roles/RACI (page 02) | authority vs day-to-day roles; RACI inherits its authority rows |
| Workspace governance rules (page 04) | Workspace template & lifecycle (page 09) | who may create + constraints vs the template that enacts them |
| Catalog & endorsement framework (page 04) | Content certification process (page 04/09) | the promoted/certified model vs the delivery-time gates applying it |

## 7. Wave exit criteria & pitfalls

**Exit criteria (definition of done per wave):**
- **W0:** archetype confirmed · outcomes quantified (not vague) · decision-rights split ratified · sponsorship gate passed.
- **W1:** `sovereignty` + region locked · platform + security foundations `agreed`.
- **W2:** all cores `agreed` · naming published · policies set for the process pages.
- **W3:** every in-scope domain onboarded or explicitly deferred.
- **W4:** monitoring + FinOps cadence live · intake stamping `criticality` · SDLC running · migration scheduled if flagged.

**Pitfalls:**
- **Facilitating from blank.** If the room is brainstorming options, you skipped the default. Always EX-WALK.
- **Deciding bundles row-by-row.** Breaks the coupling — EX-COUPLED-SET.
- **Re-arguing tightened defaults** after the sovereignty gate. The gate set them; move on.
- **No rationale.** The #1 cause of a playbook that can't be defended later. Enforce EX-RATIONALE.
- **Ignoring overrides.** Two on a page = wrong archetype. Stop and re-check; don't push through.
- **Running Wave 3 before the cores exist.** Edges extend cores; no core, nothing to extend.
- **Treating Wave 3 as one-and-done.** It's the standing domain-onboarding process — keep the kit.
