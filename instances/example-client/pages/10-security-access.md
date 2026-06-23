---
id: security-access
topic: "Security, Access & Residency"
owner: "Platform Owner"
scope: hybrid
depends_on: [governance-classes]
status: agreed
constraints:
  - "Access MUST be granted via Entra security groups only (no per-user grants)"
---

# 10. Security, Access & Residency

> `Owner Platform Owner` · `Status agreed` · `Depends on Governance Classes`

**Purpose** — set how people get access, how data is protected, and where it may live.

## The approach

Grant access through **Entra security groups only** — never per user. Apply row-level security on shared
models and turn sensitivity labels on by default. Residency is set once: enforce an approved-region list
via capacity region.

Example Logistics A/S is `standard` sovereignty — no sector regulation mandates residency or DLP.
Sensitivity labels are default-on (not mandatory) so the team builds the habit without a compliance gate.
The global footprint (EU / APAC / US) anchors capacity in North Europe for data residency alignment and
latency to the primary user population.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Access model | A1–A3 Entra-group-based only; RLS on shared models<br>**Other** | Entra-group-based only; RLS on the core model (A1–A3) | auditable, scalable; constraint is hard | agreed |
| Sensitivity labelling | A1 optional<br>A2 default-on<br>A3 mandatory + DLP<br>**Other** | Default-on (A2) | standard sovereignty; build the habit without blocking delivery | agreed |
| Residency & sovereignty | A1–A3 approved-region list via capacity region; `regulated` → full isolation + DLP + mandatory labelling<br>**Other** | North Europe capacity; approved-region list enforced (A1–A3) | EU anchor for data residency; global users served from one region | agreed |

---
[← 09 Engineering](09-engineering-cicd.md) · [Manifest](../README.md) · [Next: 11 Capacity →](11-capacity.md)
