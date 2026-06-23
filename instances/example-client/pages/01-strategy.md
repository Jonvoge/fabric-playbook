---
id: strategy
topic: "Strategy & Outcomes"
owner: "Executive Sponsor — Marianne Koch (CFO)"
scope: platform-invariant
depends_on: []
status: agreed
constraints:
  - "All strategic outcomes MUST have a named metric and a target value before wave 1 begins"
  - "Platform ambition MUST be locked before capacity sizing (page 11)"
---

# 1. Strategy & Outcomes

> `Owner Marianne Koch (CFO)` · `Status agreed` · `Depends on —`

**Purpose** — fix the measurable outcomes and the platform ambition that every later trade-off is judged against.

## The approach

Strategy is the least templatable layer — it frames everything downstream. Every arbitration later is
settled by "which option best serves these outcomes?" Without ratified, quantified outcomes,
arbitration has no tiebreaker and decisions default to whoever shouts loudest.

For Example Logistics A/S, four forcing functions shaped the outcome set. The **time-zone gap** —
APAC, US, and AU users gated on a single CET batch — is the most visible operational pain; supply
chain dashboards are stale by 6–8 hours when warehouse shifts hand over. The **legacy estate** —
SSAS Tabular cube (14 subject areas, ~180 measures), MDS customer and product master, three SQL
Server instances — is large and cannot coexist indefinitely with a new platform. The **DevOps
mandate** from the CTO is non-negotiable from day one: no portal-only changes, git integration on
all governed workspaces. And the **P2 contract renewal** in September 2026 is a hard cost deadline
that compresses wave 1 to roughly two months.

Platform ambition is unambiguously **unified**: BI, data engineering, and real-time (Eventstream
for the Kafka IoT stream) must live on the same platform. "Fabric for BI only" was explicitly
rejected — the supply chain domain's Kafka feed and the engineering work in commercial require the
full Fabric stack.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Target outcomes (3–5, quantified) | A1 faster insight · self-service · consolidate PBI<br>A2 faster insight · self-service · retire legacy · cost attribution<br>A3 data-as-product · domain autonomy · AI · decommission<br>**Other** | Five outcomes (A2 extended — see table below) | covers all four forcing functions; cost attribution deferred to wave 2 | agreed |
| Platform ambition | A1 unified, Power-BI-first<br>A2 unified (BI + emerging data engineering)<br>A3 unified backbone for a data mesh<br>**Other** | Unified — BI + data engineering + real-time (A2+) | supply chain Kafka and commercial engineering require the full Fabric stack, not BI-only | agreed |

## Outcome register

| # | Outcome | Metric | Baseline | Target | Wave |
|---|---|---|---|---|---|
| O1 | Reduce reporting lag for supply chain operational dashboards | Average data age at dashboard load | T+8h (single CET batch) | ≤ T+30 min | 1 |
| O2 | Retire SSAS Tabular cube | Cube-dependent reports remaining | 14 subject areas / ~180 measures | 0 (all replaced by Direct Lake models) | 2 |
| O3 | Bring ungoverned PBI reports into governance or retire them | % of reports in a governed or retired state | ~35% governed | ≥ 85% governed or retired | 3 |
| O4 | CI/CD coverage on all Central and Governed workspaces | % of workspaces with git integration enabled | 0% | 100% | 1 |
| O5 | Cost attribution — showback per domain | Monthly per-domain capacity cost visible | Not tracked | Showback live, reviewed monthly | 2 |

---
[← 00 How to use](00-how-to-use.md) · [Manifest](../README.md) · [Next: 02 People →](02-people-operating-model.md)
