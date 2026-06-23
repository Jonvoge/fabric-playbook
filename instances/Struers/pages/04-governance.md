---
id: governance
topic: "Governance, Catalog & Quality"
owner: "CoE Lead"
scope: hybrid
depends_on: [governance-classes]
status: proposed
constraints: []
---

# 4. Governance, Catalog & Quality

> `Owner CoE Lead` · `Status proposed` · `Depends on Governance Classes`

**Purpose** — make data findable and trustworthy: tenant-setting control, the endorsement model, and what "good data" means.

## The approach

Hold the security-sensitive tenant settings central and delegate domain-scoped ones. Make data findable
through a catalog and mark trust through **endorsement** (promoted → certified). Define data quality as a
framework the centre owns and domains apply to their own products.

```mermaid
flowchart LR
  A["Draft content"] --> B["Promoted<br/>(domain endorses)"]
  B --> C["Certified<br/>(centre certifies core)"]
```

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Tenant settings | A1–A3 central baseline; delegate domain-scoped; hold security/sharing/export central<br>**Other** | _proposed_ | safe defaults without blocking delivery | proposed |
| Endorsement model | A1 promoted only<br>A2 promoted + certified (centre certifies the core)<br>A3 domain-certified within standard<br>**Other** | _proposed_ | trust signal scales with autonomy | proposed |
| Data quality | A1 central checks<br>A2 central framework; domains own rules<br>A3 domain-owned DQ + monitoring<br>**Other** | _proposed_ | quality ownership follows product ownership | proposed |
| Catalog / discovery | A1–A3 OneLake catalog + endorsements; Purview when lineage/classification needed<br>**Other** | _proposed_ | findability without premature tooling | proposed |

---
[← 03 Governance classes](03-governance-classes.md) · [Manifest](../README.md) · [Next: 05 Architecture →](05-architecture.md)
