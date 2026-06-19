---
id: naming-standards
topic: "Naming Standards"
owner: "Platform Owner"
scope: platform-invariant
depends_on: [governance-classes]
status: proposed
constraints:
  - "Every object name MUST follow <prefix>-<domain>-<qualifier>; lowercase, hyphen-separated"
  - "Item-type prefix is MANDATORY and drawn from the prefix table below"
---

# 12. Naming Standards

> `Owner Platform Owner` · `Status proposed` · `Depends on Governance Classes`

**Purpose** — give every object one predictable, machine-checkable name so people and agents can find, group, and govern things without guessing.

![Anatomy of an object name](../diagrams/naming-anatomy.svg)

## The approach

Naming is **cross-cutting** — it does not vary by governance class or org profile. One grammar applies
everywhere: a mandatory **item-type prefix**, the **domain**, then a **qualifier** (environment, layer,
or cluster). The grammar is settled; the only thing that varies is **how hard it is enforced**, which
tracks how much the platform team can rely on tooling versus policy. The tables below are machine-truth —
agents and CI read them directly to validate or generate names.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Naming grammar | A1–A3 `<prefix>-<domain>-<qualifier>`<br>**Other** | _proposed_ | one grammar, no per-team dialects | proposed |
| Casing & separator | A1–A3 lowercase + hyphen<br>**Other** | _proposed_ | portable, URL-safe | proposed |
| Enforcement level | A1 advisory<br>A2 enforced-by-template<br>A3 enforced-by-policy<br>**Other** | _proposed_ | match enforcement to tooling maturity | proposed |

## Prefix table

| Object | Prefix | Example |
|---|---|---|
| Capacity | `cap` | `cap-commercial` |
| Workspace | `ws` | `ws-sales-prod` |
| Lakehouse | `lh` | `lh-sales-bronze` |
| Warehouse | `wh` | `wh-finance-gold` |
| Semantic model | `sm` | `sm-sales-core` |
| Pipeline | `pl` | `pl-sales-ingest` |
| Dataflow Gen2 | `df` | `df-sales-budget` |
| Notebook | `nb` | `nb-sales-transform` |
| Connection | `conn` | `conn-erp-prod` |

## Grammar by object

| Object | Pattern | Qualifier values |
|---|---|---|
| Capacity | `cap-<domain-cluster>` | cluster name |
| Workspace | `ws-<domain>-<env>` | env: `dev` · `test` · `prod` |
| Lakehouse | `lh-<domain>-<layer>` | layer: `bronze` · `silver` · `gold` |
| Warehouse | `wh-<domain>-<layer>` | layer: `silver` · `gold` |
| Semantic model | `sm-<domain>-<purpose>` | purpose: `core` · `<report-area>` |

---
[← 11 Capacity](11-capacity.md) · [Manifest](../README.md) · [Next: 13 Enablement →](13-enablement-adoption.md)
