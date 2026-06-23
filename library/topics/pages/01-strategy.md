---
id: strategy
topic: "Strategy & Outcomes"
owner: "Executive Sponsor"
scope: platform-invariant
depends_on: []
status: proposed
constraints: []
---

# 1. Strategy & Outcomes

> `Owner Executive Sponsor` · `Status proposed` · `Depends on —`

**Purpose** — fix the measurable outcomes and the platform ambition that every later trade-off is judged against.

## The approach

Strategy is the least templatable layer — it frames everything downstream. Name **3–5 measurable
outcomes**, each with a metric and a target, because every arbitration later is settled by "which option
best serves these?" Then set the **platform ambition**: is Fabric the single platform, one of several, or
a single workload? Without ratified outcomes, arbitration has no tiebreaker.

A good outcome is **falsifiable**: "Reduce average reporting latency from T+1 to T+15 min for shared
sources" is an outcome. "Improve data culture" is not. Outcomes cluster by archetype: A1 organisations
tend toward consolidation and self-service enablement; A2 adds domain autonomy and legacy retirement; A3
reaches for data-as-product metrics and AI workloads. Name 3–5 — more than that dilutes the signal and
every decision arbitration becomes inconclusive.

Platform ambition sets consolidation scope. "Fabric as the single platform" is the default for greenfield
and A1/A2 orgs; "one of several" is the honest answer in enterprises where another cloud data warehouse
is entrenched and a full migration is not funded. State it explicitly — downstream capacity, licensing,
and migration decisions all depend on it. A platform-ambition decision that slips to wave 2 means wave 1
trades off blindly.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Target outcomes (pick 3–5, quantified) | A1 faster insight · self-service · consolidate PBI<br>A2 faster insight · self-service · retire legacy · cost attribution<br>A3 data-as-product · domain autonomy · AI · decommission<br>**Other** | _proposed_ | downstream trade-offs arbitrate against these | proposed |
| Platform ambition | A1 unified, Power-BI-first<br>A2 unified (BI + emerging data engineering)<br>A3 unified backbone for a data mesh<br>**Other** | _proposed_ | sets consolidation ambition | proposed |

---
[← 00 How to use](00-how-to-use.md) · [Manifest](../README.md) · [Next: 02 People →](02-people-operating-model.md)
