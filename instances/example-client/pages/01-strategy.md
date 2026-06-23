---
id: strategy
topic: "Strategy & Outcomes"
owner: "Executive Sponsor"
scope: platform-invariant
depends_on: []
status: agreed
constraints: []
---

# 1. Strategy & Outcomes

> `Owner Executive Sponsor` · `Status agreed` · `Depends on —`

**Purpose** — fix the measurable outcomes and the platform ambition that every later trade-off is judged against.

## The approach

Strategy is the least templatable layer — it frames everything downstream. Name **3–5 measurable
outcomes**, each with a metric and a target, because every arbitration later is settled by "which option
best serves these?" Then set the **platform ambition**: is Fabric the single platform, one of several, or
a single workload? Without ratified outcomes, arbitration has no tiebreaker.

For Example Logistics A/S, three forcing functions shape the outcomes: the **APAC/US latency problem**
(shared sources gated on a single CET batch), the **legacy estate** (SSAS cube + MDS + on-prem SQL
heading for retirement), and the **DevOps requirement** (stated hard by the sponsor — version control and
CI/CD are non-negotiable from day one). A fourth outcome — cost attribution — is deferred to wave 2
until capacity sizing has stabilised. Platform ambition is unambiguously unified; the commercial domain
needs data-engineering capability on the same platform as BI.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Target outcomes (pick 3–5, quantified) | A1 faster insight · self-service · consolidate PBI<br>A2 faster insight · self-service · retire legacy · cost attribution<br>A3 data-as-product · domain autonomy · AI · decommission<br>**Other** | Faster cross-TZ insight · domain self-service · retire SSAS + MDS · CI/CD on the platform (A2 + DevOps, cost attribution wave 2) | maps directly to the three forcing functions; cost attribution deferred until capacity sizing is stable | agreed |
| Platform ambition | A1 unified, Power-BI-first<br>A2 unified (BI + emerging data engineering)<br>A3 unified backbone for a data mesh<br>**Other** | Unified — BI + data engineering (A2) | commercial domain is engineering-capable; platform must serve both self-service and pipeline workloads | agreed |

---
[← 00 How to use](00-how-to-use.md) · [Manifest](../README.md) · [Next: 02 People →](02-people-operating-model.md)
