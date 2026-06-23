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
models and turn sensitivity labels on by default. Residency is set once: enforce an approved-region list
via capacity region. The `regulated` overlay tightens this end — mandatory labelling + DLP, network
isolation, stricter conditional access — and otherwise everything inherits the base archetype.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Access model | A1–A3 Entra-group-based only; RLS on shared models<br>**Other** | _proposed_ | auditable, scalable access | proposed |
| Sensitivity labelling | A1 optional<br>A2 default-on<br>A3 mandatory + DLP<br>**Other** | _proposed_ | protection scales with exposure | proposed |
| Residency & sovereignty | A1–A3 approved-region list via capacity region; `regulated` → full isolation + DLP + mandatory labelling<br>**Other** | _proposed_ | meet obligations without over-locking | proposed |

---
[← 09 Engineering](09-engineering-cicd.md) · [Manifest](../README.md) · [Next: 11 Capacity →](11-capacity.md)
