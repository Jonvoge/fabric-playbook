---
id: governance
topic: "Governance, Catalog & Quality"
owner: "CoE Lead"
scope: hybrid
depends_on: [governance-classes]
status: agreed
constraints: []
---

# 4. Governance, Catalog & Quality

> `Owner CoE Lead` · `Status agreed` · `Depends on Governance Classes`

**Purpose** — make data findable and trustworthy: tenant-setting control, the endorsement model, and what "good data" means.

## The approach

Hold the security-sensitive tenant settings central and delegate domain-scoped ones. Make data findable
through a catalog and mark trust through **endorsement** (promoted → certified). Define data quality as a
framework the centre owns and domains apply to their own products.

Given the current PBI sprawl and weak governance baseline, the endorsement model is the most visible
early win — it gives consumers a clear signal of what has been reviewed and by whom. Data quality rules
start central (the CoE defines the framework) and domain ownership transfers as maturity builds.

```mermaid
flowchart LR
  A["Draft content"] --> B["Promoted<br/>(domain endorses)"]
  B --> C["Certified<br/>(CoE certifies core)"]
```

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Tenant settings | A1–A3 central baseline; delegate domain-scoped; hold security/sharing/export central<br>**Other** | Central baseline + domain delegation (A1–A3) | safe defaults without blocking delivery | agreed |
| Endorsement model | A1 promoted only<br>A2 promoted + certified (centre certifies the core)<br>A3 domain-certified within standard<br>**Other** | Promoted + certified — CoE certifies core (A2) | visible trust signal; directly addresses PBI sprawl and weak current governance | agreed |
| Data quality | A1 central checks<br>A2 central framework; domains own rules<br>A3 domain-owned DQ + monitoring<br>**Other** | Central framework; domains own rules (A2) | CoE sets the bar; domains responsible for their own products | agreed |
| Catalog / discovery | A1–A3 OneLake catalog + endorsements; Purview when lineage/classification needed<br>**Other** | OneLake catalog + endorsements (A1–A3) | start simple; add Purview when lineage or classification is required | agreed |

---
[← 03 Governance classes](03-governance-classes.md) · [Manifest](../README.md) · [Next: 05 Architecture →](05-architecture.md)
