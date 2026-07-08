---
id: transformation-modelling
topic: "Transformation & Modelling"
owner: "Lead Architect"
scope: hybrid
depends_on: [architecture]
status: proposed
constraints: []
---

# 7. Transformation & Modelling

> `Owner Lead Architect` · `Status proposed` · `Depends on Architecture`

**Purpose** — decide where logic lives and how semantic models are built on top of the lake.

## The approach

Push transformation into the lake (silver/gold) and keep the semantic layer thin. Build on a **conformed
core** of shared dimensions and facts; let domains extend with composite models rather than re-deriving
the basics. Prefer Direct Lake so models read OneLake without import copies. Shape facts at a single
grain, reuse one dimension per role, and standardise the measure layer (base measures + calculation
groups + display folders) so consumers meet consistent, defensible numbers.

```mermaid
flowchart LR
  G["Gold tables<br/>(OneLake)"] --> M["Semantic models<br/>(Direct Lake)"]
  M --> R["Reports"]
```

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Modelling approach | A1 import star schemas<br>A2 Direct Lake core; domain composite models<br>A3 per-domain models on a certified core<br>**Other** | _proposed_ | balance reuse against autonomy | proposed |
| Logic location | A1–A3 transform in silver/gold; thin semantic layer<br>**Other** | _proposed_ | one place for logic, not scattered in DAX | proposed |
| Shared dimensions | A1 central<br>A2 conformed core, domains extend<br>A3 domain-published, federated<br>**Other** | _proposed_ | consistency without a bottleneck | proposed || Aggregation / group-by placement | A1–A3 pre-aggregate in silver/gold where reused; model/DAX only for presentation-time<br>**Other** | compute once, not per report | proposed |
| Fact grain & consolidation | A1 wide facts where simple<br>A2 separate facts on conformed dims; merge only at identical grain<br>A3 domain facts as products on conformed dims<br>**Other** | avoid fan-out and wrong totals | proposed |
| Role-playing dimensions | A1–A3 single dim + inactive relationships + USERELATIONSHIP (no physical copies)<br>**Other** | one dimension, reused across roles | proposed |
| Measure standards | A1 basic/ad-hoc measures<br>A2 base measures + calculation groups + display folders<br>A3 standardised measure layer + calculation groups, domain-owned<br>**Other** | maintainable, consistent measures | proposed |
| Measure & object naming | A1–A3 agreed measure-naming + display-folder convention; business-friendly display names, technical names in git<br>**Other** | consumer clarity | proposed |
---
[← 06 Ingestion](06-ingestion.md) · [Manifest](../README.md) · [Next: 08 Serving →](08-semantic-serving.md)
