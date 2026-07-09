---
id: naming-standards
topic: "Naming Standards"
owner: "Platform Owner"
scope: platform-invariant
depends_on: [governance-classes]
status: proposed
constraints:
  - "Semantic models MUST be named SM_[Topic]"
---

# 12. Naming Standards

> `Owner Platform Owner` · `Status proposed` · `Depends on Governance Classes`

**Purpose** — keep object names predictable so people and agents can find, group and govern things.

> **Sprint note:** DRS already runs an established naming grammar (uppercase, underscore-separated,
> item-type prefix — e.g. `WS_DM_DataWarehouse`, `DP_SemanticModels`), documented in DRS's DevOps wiki.
> The authoritative reference Excel is currently **missing** (flagged in the assessment). This page
> carries only the front-end naming decision raised in the sprint; the full grammar is not re-derived here.

## The approach

Keep DRS's existing grammar — **`<PREFIX>_<...>`**, PascalCase, underscore-separated — and standardise
the **semantic-model** name on **`SM_[Topic]`** for legibility.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Semantic-model naming | free · **`SM_[Topic]`** | **`SM_[Topic]`** (Rec. 5) | easier-to-understand naming | proposed |
| Grammar source of truth | this page · **DRS DevOps wiki** | **DRS wiki (existing grammar)** — recreate the missing reference Excel | grammar is already established back-end; don't fork it | proposed |

## Known prefixes (from DRS's existing grammar)

| Object | Prefix | Example |
|---|---|---|
| Workspace | `WS_` | `WS_DM_DataWarehouse` |
| Data Product workspace | `DP_` | `DP_SemanticModels` |
| Semantic model | `SM_` | `SM_Finans` |

> Parking lot (from the sprint): recreate the authoritative naming Excel, and decide whether naming
> should differ in PROD.

---
[← 10 Security](10-security-access.md) · [Manifest](../README.md)
