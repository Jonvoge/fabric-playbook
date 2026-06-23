---
id: naming-standards
topic: "Naming Standards"
owner: "Platform Owner — Anders Holm (Head of IT)"
scope: platform-invariant
depends_on: [governance-classes]
status: agreed
constraints:
  - "Every object name MUST follow <prefix>-<domain>-<qualifier>; lowercase, hyphen-separated"
  - "Item-type prefix is MANDATORY and drawn from the prefix table below"
  - "Domain tokens are fixed: commercial | supply | finance | ops | hr | core"
---

# 12. Naming Standards

> `Owner Anders Holm (Head of IT)` · `Status agreed` · `Depends on Governance Classes`

**Purpose** — give every object one predictable, machine-checkable name so people and agents can find, group, and govern things without guessing.

![Anatomy of an object name](../diagrams/naming-anatomy.svg)

## The approach

Naming is **cross-cutting** — it does not vary by governance class or org profile. One grammar applies
everywhere: a mandatory **item-type prefix**, the **domain**, then a **qualifier** (environment, layer,
or cluster). The tables below are machine-truth — agents and CI read them directly to validate names.

The domain tokens for Example Logistics A/S are fixed at six: `commercial`, `supply`, `finance`,
`ops`, `hr`, `core`. No other domain tokens are valid. New domains require a governance decision
and a playbook update before any workspaces are provisioned. The provisioning script (`new-workspace.ps1`)
enforces this at creation time; a workspace name that doesn’t match the grammar is rejected.

Casing is lowercase + hyphen throughout: portable across the Fabric portal, REST APIs, git paths,
and Terraform/Bicep templates. Mixed-case and underscore variants are not accepted.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Naming grammar | A1–A3 `<prefix>-<domain>-<qualifier>`<br>**Other** | `<prefix>-<domain>-<qualifier>` (A1–A3) | one grammar; no per-team dialects | agreed |
| Casing & separator | A1–A3 lowercase + hyphen<br>**Other** | Lowercase + hyphen (A1–A3) | portable, URL-safe | agreed |
| Enforcement level | A1 advisory<br>A2 enforced-by-template<br>A3 enforced-by-policy<br>**Other** | Enforced-by-template (A2) | workspace provisioning script enforces at creation time | agreed |

## Prefix table

| Object | Prefix | Example |
|---|---|---|
| Capacity | `cap` | `cap-commercial` |
| Workspace | `ws` | `ws-commercial-prod` |
| Lakehouse | `lh` | `lh-commercial-bronze` |
| Warehouse | `wh` | `wh-finance-gold` |
| Semantic model | `sm` | `sm-core-kpi` |
| Pipeline | `pl` | `pl-commercial-ingest` |
| Dataflow Gen2 | `df` | `df-finance-budget` |
| Notebook | `nb` | `nb-commercial-transform` |
| Connection | `conn` | `conn-erp-prod` |

## Grammar by object

| Object | Pattern | Qualifier values |
|---|---|---|
| Capacity | `cap-<domain-cluster>` | `commercial` · `core` |
| Workspace | `ws-<domain>-<env>` | env: `dev` · `test` · `prod` |
| Lakehouse | `lh-<domain>-<layer>` | layer: `bronze` · `silver` · `gold` |
| Warehouse | `wh-<domain>-<layer>` | layer: `silver` · `gold` |
| Semantic model | `sm-<domain>-<purpose>` | purpose: `core` · `kpi` · `<report-area>` |

---
[← 11 Capacity](11-capacity.md) · [Manifest](../README.md) · [Next: 13 Enablement →](13-enablement-adoption.md)
