---
id: security-access
topic: "Security, Access & Residency"
owner: "Platform Owner"
scope: hybrid
depends_on: [governance-classes]
status: proposed
constraints:
  - "Access MUST be granted via Entra security groups only (no per-user grants)"
---

# 10. Security, Access & Residency

> `Owner Platform Owner` · `Status proposed` · `Depends on Governance Classes`

**Purpose** — set how people get access to models and reports, and how row-level security is designed.

## The approach

Share **preferentially through Entra security groups** (a full access-needs analysis is still to be done —
see the to-do below). Grant **model-workspace** access only to developers (who bypass RLS); give report
consumers **Read** on the specific model (Read honours RLS), and **Build** to those who need the model in
Excel (Build also honours RLS). Distribute reports via **Workspace/Org Apps**, using **Audiences** to
segregate groups. Centralise RLS logic where it makes sense — but only after a per-model security-needs
analysis — and move toward **shared access tables maintained in the DW**, driven by an org hierarchy from
the new HR system.

## Decisions

### Access model

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Sharing mechanism | per-user · **Entra security groups (preferred)** | **share preferentially via security groups** — *pending an access-needs analysis* | auditable, scalable (constraint above) | proposed |
| Model-workspace access | all users · **developers only** | **model-workspace access to developers only — they bypass RLS** | workspace membership over-exposes; only builders need it | proposed |
| Consumer model access | workspace access · **Read on the model + RLS role** | **report consumers get Read on the specific model + any RLS role** (auto from Workspace Apps or manually via the model's Permission page) | Read honours RLS | proposed |
| Excel / analyze-in-Excel access | Read · **Build on the specific model + RLS role** | **users who want the model in Excel get Build + any RLS role** | Build also honours RLS | proposed |
| Report-workspace access | broad · **only for users who want to build reports themselves** | **grant report-workspace access only to self-service report builders** | keeps consumers out of the build surface | proposed |
| Report distribution | workspace access · **Workspace Apps / Org Apps** | **distribute reports preferably via Workspace/Org Apps; Audiences segregate user groups on one workspace** | consumer-first, granular | proposed |

### Row-Level Security

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| RLS starting point | design ad-hoc · **security-needs analysis per model first** | **start with a security-needs analysis per model / of current RLS** | there is genuine uncertainty on how RLS is best maintained | proposed |
| Access-table strategy | per-model tables · **shared access tables in the DW** | **evaluate whether several models can share access tables maintained in the DW**, based on a new org-hierarchy extract from the new HR system | centralise the logic where it makes sense | proposed |
| RLS role tiers | single role · **tiered (read-all / read-much / read-limited)** | **tiered RLS with multiple roles per model**: read-all for leadership security groups · read-much for e.g. managers / union reps · read-limited (dynamic, narrow scope) for everyone else | most models need graduated visibility | proposed |

### To-do — access-needs analysis

- **Analyse access needs** across models before finalising security-group design (the "?" on sharing
  preference resolves here).
- **Analyse current RLS / security needs per semantic model** before centralising.
- Confirm the **new HR-system org-hierarchy extract** as the source for dynamic access tables in the DW.

---
[← 09 Engineering](09-engineering-cicd.md) · [Manifest](../README.md) · [Next: 12 Naming →](12-naming-standards.md)
