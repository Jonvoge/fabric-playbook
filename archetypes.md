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

## Modifiers

Three values fork a default away from the plain archetype answer. Each has exactly one **setter** —
never invent a fourth modifier, and never apply one before its setter has run.

| Modifier | Values | Set by (setter) | Applied to |
|---|---|---|---|
| `domain_maturity` | `self-service` · `engineering-capable` | the **assessment**, per domain (re-run for each new domain) | per-domain choices: ingestion tooling, CI/CD rigor, enablement track, content ownership |
| `sovereignty` | `standard` · `regulated` | the **residency & sovereignty decision** (Wave 1 entry gate, page 04/10) | region lock, network isolation, labelling + DLP, classification + lineage, DR |
| `criticality` | `standard` · `business-critical` | **solution intake** (SDLC, page 09) — stamped per workload | environment isolation (Pattern 2 → 3), DR posture (geo-redundancy + runbook + RPO/RTO) |

A modifier must be set before it is **applied to a specific instance** — not before its consuming
decision is authored. Criticality-routed decisions (environments, DR) are therefore authored as
**mapping rules** ("if business-critical then …") during the workshops and applied continuously as
intake stamps each workload.
