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

**Purpose** — set how people get access, how data is protected, and where it may live.

## The approach

Grant access through **Entra security groups only** — never per user. Apply row-level security on shared
models and turn sensitivity labels on by default. Design RLS and OLS **once on the certified model** —
not per report — with a documented group→role mapping and a "view as" test matrix checked at promotion.
Residency is set once: enforce an approved-region list via capacity region. The `regulated` overlay
tightens this end — mandatory labelling + DLP, network isolation, stricter conditional access — and
otherwise everything inherits the base archetype.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Access model | A1–A3 Entra-group-based only; RLS on shared models<br>**Other** | _proposed_ | auditable, scalable access | proposed |
| Sensitivity labelling | A1 optional<br>A2 default-on<br>A3 mandatory + DLP<br>**Other** | _proposed_ | protection scales with exposure | proposed |
| Residency & sovereignty | A1–A3 approved-region list via capacity region; `regulated` → full isolation + DLP + mandatory labelling<br>**Other** | _proposed_ | meet obligations without over-locking | proposed |
| RLS pattern | A1 static roles → Entra groups<br>A2 dynamic (USERPRINCIPALNAME + mapping table) where scale needs; static where simple<br>A3 dynamic mapping tables, domain-owned<br>**Other** | _proposed_ | scale without a role per unit | proposed |
| RLS scope | A1–A3 restrict on the organising axis (cost-centre / department / domain) per sensitive model<br>**Other** | _proposed_ | users see only their slice | proposed |
| Object-level security (OLS) | A1–A3 OLS to hide sensitive columns/measures (salary/HR/PII); separate restricted model only if OLS insufficient<br>**Other** | _proposed_ | column-level protection | proposed |
| Where security lives | A1–A3 define RLS/OLS once on the shared certified model, not per report<br>**Other** | _proposed_ | no duplicated security logic | proposed |
| Group → role mapping | A1–A3 documented Entra group → RLS role mapping<br>**Other** | _proposed_ | auditable | proposed |
| All-access exemption | A1–A3 named controller/all-access group explicitly exempt where intended<br>**Other** | _proposed_ | matches operational reality | proposed |
| RLS/OLS testing | A1–A3 "view as" + test matrix per role, checked at promotion<br>**Other** | _proposed_ | prevents leaks after deploy | proposed |

---
[← 09 Engineering](09-engineering-cicd.md) · [Manifest](../README.md) · [Next: 11 Capacity →](11-capacity.md)
