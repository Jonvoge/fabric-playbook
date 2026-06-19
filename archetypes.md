# Archetypes

A short assessment places a client on one **base archetype**, which sets the starting default for every
decision. The questions and options are the same across archetypes — only the defaults differ. A
`regulated` **overlay** can sit on top of any base.

## The three bases

**A1 — Power BI Moderniser.** Centralised, IT/BI-led, heavy existing Power BI estate, little or no
data-engineering team. Adopting Fabric mainly to extend Power BI. *Keep it central and simple; invest in
enablement.*

**A2 — Federated Scale-up.** Mid-to-large, several business units with their own analysts, a central
platform team that enables without becoming the bottleneck, mixed maturity by unit. *Autonomy with
guardrails — central standards, domain-owned products.*

**A3 — Data-Mesh Enterprise.** Large, high maturity, deliberately decentralised, strong engineering,
FinOps-conscious. *Decentralise inside a thin global standard — per-domain capacity, budget, ownership.*

| Axis | A1 | A2 | A3 |
|---|---|---|---|
| Ownership | central | federated | mesh |
| Capacity | one shared | few by cluster | per domain |
| CI/CD | deployment pipelines | git + pipelines | full git + IaC |
| Funding | pooled | showback → chargeback | chargeback |
| Governance | central, light | central + delegation | thin global + domain self-gov |
| Dominant investment | enablement | guardrails | engineering + FinOps |

## The regulated overlay

Public sector, finance, health — residency, compliance, auditability dominate. Applied as
`sovereignty: regulated` on top of A1/A2/A3. It tightens only: region-locked capacity, network
isolation, mandatory labelling + DLP, mandatory classification + lineage, stronger DR. Everything else
inherits the base.

## Per-domain maturity

Independently of the org archetype, each domain is `self-service` (low-code, consumes central outputs)
or `engineering-capable` (writes its own pipelines/products). This routes the per-domain choices.
