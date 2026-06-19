---
id: operating-model
topic: "People & Operating Model"
owner: "Executive Sponsor"
scope: platform-invariant
depends_on: [strategy]
status: proposed
constraints: []
---

# 2. People & Operating Model

> `Owner Executive Sponsor` · `Status proposed` · `Depends on Strategy`

**Purpose** — set who owns what, who decides, how it's funded, and the roles that run it.

## The approach

The operating model is the single most determinative choice — most later `scope` classifications flow
from it. Decide it, then the funding posture, the decision rights (who decides / approves / arbitrates),
the content-ownership default, and the core roles. Capture decision *authority* here; day-to-day RACI
sits in the roles table.

```mermaid
flowchart LR
  C["Central platform team<br/>(enables, sets standards)"]
  D1["Domain A<br/>owns products"]
  D2["Domain B<br/>owns products"]
  C --> D1
  C --> D2
```

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Operating model | A1 centralised<br>A2 federated / hub-and-spoke<br>A3 data mesh<br>**Other** | _proposed_ | determines nearly every downstream scope | proposed |
| Funding | A1 central cost centre<br>A2 showback → chargeback<br>A3 chargeback per domain<br>**Other** | _proposed_ | capacity sizing + FinOps depend on it | proposed |
| Decision rights | A1 central authority<br>A2 CoE + delegated domain authority<br>A3 federated within a thin global standard<br>**Other** | _proposed_ | unclear authority stalls everything | proposed |
| Content ownership | A1 managed self-service + enterprise core<br>A2 managed self-service default; business-led for mature units<br>A3 domain-owned products the norm<br>**Other** | _proposed_ | drives domain design + tooling split | proposed |
| Core roles | A1–A3 five roles: data-product owner · domain admin · platform engineer · steward · consumer<br>**Other** | _proposed_ | shared vocabulary for the RACI | proposed |

## RACI (fill per client)

| Activity | Owner | Approver | Contributor | Informed |
|---|---|---|---|---|
|  |  |  |  |  |

---
[← 01 Strategy](01-strategy.md) · [Manifest](../README.md) · [Next: 03 Governance classes →](03-governance-classes.md)
