---
id: strategy
topic: "Strategy & Outcomes"
owner: "Executive Sponsor — TBD"
scope: platform-invariant
depends_on: []
status: proposed
constraints:
  - "All strategic outcomes MUST have a named metric and a target value before wave 1 begins"
  - "Platform ambition MUST be locked before capacity sizing (page 11)"
---

# 1. Strategy & Outcomes

> `Owner TBD (Executive Sponsor)` · `Status proposed` · `Depends on —`

**Purpose** — fix the measurable outcomes and the platform ambition that every later trade-off is judged against.

## The approach

Three forcing functions dominated WS1 and shape the outcome set. The **time-zone gap** — a single CET
batch means APAC and US offices receive stale data by the time their working day starts; this was named
as a barrier before any outcome discussion began, which signals real operational pain rather than a
nice-to-have. The **legacy estate** — Infor ION on-prem heading to cloud in ~2–3 years, a slow OLAP cube
with complex embedded business logic, and an ungoverned Power BI estate described bluntly as "cowboy
land" — cannot coexist indefinitely with a new platform. And **version control** was declared a
requirement on the board, not an aspiration; this implies that the engineering practice baseline, not
just the BI layer, is in scope.

The Benefits exercise produced eight themes. They cluster into three strategic bets: (1) unlock
business value from trusted, fresh data (sales insights, finance close, data-driven business culture);
(2) modernise and de-risk the estate (SQL warehouse → Fabric migration, ION source-swap readiness, PBI
governance); and (3) future-proof the platform for AI, M&A growth, and staff capability (internal
upskilling, talent attractiveness). IoT and Smart Lab real-time are acknowledged but explicitly
deprioritised — not in scope before wave 3.

Platform ambition is most likely **unified (BI + data engineering)**, consistent with A2, because IoT
and the Smart Lab domain require more than a Power-BI-first posture. This should be ratified in WS2.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Target outcomes (pick 3–5, quantified) | A1 faster insight · self-service · consolidate PBI<br>A2 faster insight · self-service · retire legacy · cost attribution<br>A3 data-as-product · domain autonomy · AI · decommission<br>**Other** | A2 extended — see Outcome Register below | covers time-zone pain, legacy modernisation, and governance — the three clusters from WS1 | proposed |
| Platform ambition | A1 unified, Power-BI-first<br>A2 unified (BI + emerging data engineering)<br>A3 unified backbone for a data mesh<br>**Other** | A2 unified (BI + data engineering + IoT/real-time) | IoT/Smart Lab and ION source-swap readiness require the full Fabric stack; Power-BI-first explicitly insufficient | proposed |

## Outcome register

_Drafted from WS1 Benefits exercise. Metrics and targets are proposals — to be ratified in WS2._

| # | Outcome | Metric | Baseline | Target | Wave |
|---|---|---|---|---|---|
| O1 | Eliminate time-zone reporting lag for APAC and US | Average data age at load for APAC/US users | T+ CET batch (~8–12h stale) | ≤ T+1h | 1 |
| O2 | Govern or retire ungoverned Power BI estate | % of reports in governed or retired state | TBD (est. majority ungoverned) | ≥ 80% governed or retired | 2–3 |
| O3 | Migrate SQL warehouse analytical layer to Fabric — semantic models to Direct Lake | Warehouse-dependent semantic models remaining on on-prem SQL | TBD (full estate) | 0 | 2–3 |
| O4 | Version control on all platform workspaces | % of workspaces with git integration | 0% | 100% | 1 |
| O5 | Enable data-driven Sales insights from CRM | Sales/service reports served from governed CRM data | Ad-hoc, ungoverned | Governed, self-service for Sales domain | 2 |
| O6 | Optimise global Finance processes (e.g. month-end close) | Finance close cycle time / manual steps | TBD | TBD | 2 |
| O7 | Future-proof for ERP cloud migration | ION ingestion layer is source-swappable | Not source-swappable | Source-swap validated | Before ION cloud migration ~2–3y |
| O8 | _(IoT / Smart Lab — backlog)_ | TBD | TBD | TBD | Wave 3+ |

---
[← 00 How to use](00-how-to-use.md) · [Manifest](../README.md) · [Next: 02 People →](02-people-operating-model.md)
