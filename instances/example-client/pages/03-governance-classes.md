---
id: governance-classes
topic: "Governance Classes & Workspace Model"
owner: "Platform Owner — Anders Holm (Head of IT)"
scope: platform-invariant
depends_on: [operating-model]
status: agreed
constraints:
  - "Every workspace MUST be assigned exactly one governance class"
  - "Finance domain production workspaces MUST be Central class (SOX audit trail requirement)"
  - "Supply chain IoT pipeline workspaces MUST be Central class (reliability and lineage requirement)"
---

# 3. Governance Classes & Workspace Model

> `Owner Anders Holm (Head of IT)` · `Status agreed` · `Depends on Operating Model`

**Purpose** — set the workspace classes that decide the playing rules: which items are allowed, who creates them, and how much rigor applies.

![Governance class strictness gradient](../diagrams/governance-gradient.svg)

## The approach

This is the **pivotal axis** — decided early, because every later page keys its rules to it. Three
classes match the federated model. The critical choice here was not the number of classes but the
assignment of Finance and Supply Chain's IoT pipeline workspaces: both must be **Central class**,
not Governed.

Finance must be Central because SOX requires an auditable change trail with no self-certification. A
Governed-class Finance workspace would allow domain self-approval of changes — that fails the audit.
Henrik Sørensen and the Finance CAB were explicit: Finance production workspaces sit in Central,
under the same full CI/CD gates as the platform's core workspaces.

Supply Chain's Kafka/IoT pipeline workspaces must also be Central because the operational reliability
constraint (≤2h downtime) demands the tightest provisioning, CI/CD gates, and geo-redundancy that
Central class provides. Rasmus Dahl's team accepted the stricter process in exchange for the
reliability guarantee.

The *governed* tier captures commercial analytics pipelines, the domain models, and operational
dashboards. The *self-service* tier is the fence for business-led reporting in ops and HR. This
structure converts the current ungoverned P2 estate: reports either graduate into a governed
workspace or are reviewed and retired.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| How many classes | A1 two (central + self-service)<br>A2 three (+ governed)<br>A3 three–four (+ sandbox)<br>**Other** | Three — Central / Governed / Self-service (A2) | governed tier converts ungoverned P2 estate; Finance + IoT pipelines promoted to Central | agreed |
| Class assignment | A1–A3 one class per workspace, set at creation<br>**Other** | One class per workspace, set at creation (A1–A3) | unambiguous rules; assignment locked in provisioning script | agreed |
| Rigor gradient | A1 light<br>A2 rising toward central<br>A3 thin global + domain self-gov<br>**Other** | Rising toward Central (A2) | enforcement tracks ownership and compliance obligation | agreed |

## Per-class model

| Dimension | Central | Governed | Self-service | Detailed on |
|---|---|---|---|---|
| Who uses it | Platform core · Finance prod · IoT pipelines | Commercial · Supply chain analytics · Ops dashboards | Finance self-service · Ops · HR | — |
| Allowed items | Lakehouses, pipelines, notebooks, semantic models, reports | All Central items + Dataflows Gen2 | Dataflows Gen2, reports, semantic models | 04 Governance |
| Creation rights | Thomas Bak (platform eng.) | Domain lead + CoE approval | Domain business users | 02 People |
| CI/CD | Full gated; PR + 2 reviewers; Finance → CAB sign-off | Lighter gates; PR + 1 reviewer | Optional; deployment pipelines only | 09 Engineering |
| Certification | Mandatory before promotion | Encouraged; domain admin certifies | Not required | 04 Governance |
| Access | Named Entra groups; no broad sharing | Scoped Entra groups; RLS on shared models | Broad within workspace fence | 10 Security |
| Geo-redundancy | Mandatory for SOX and supply chain RT | Optional (recommended for business-critical) | Not required | 11 Capacity |

## Workspace inventory (fill as provisioned)

| Workspace | Domain | Class | Env | Provisioned | Owner |
|---|---|---|---|---|---|
| ws-core-dev | core | Central | dev | — | Thomas Bak |
| ws-core-test | core | Central | test | — | Thomas Bak |
| ws-core-prod | core | Central | prod | — | Thomas Bak |
| ws-finance-dev | finance | Central | dev | — | Henrik Sørensen |
| ws-finance-test | finance | Central | test | — | Henrik Sørensen |
| ws-finance-prod | finance | Central | prod | — | Henrik Sørensen |
| ws-supply-iot-prod | supply_chain | Central | prod | — | Rasmus Dahl |
| ws-commercial-dev | commercial | Governed | dev | — | Katrine Møller |
| ws-commercial-prod | commercial | Governed | prod | — | Katrine Møller |
| ws-ops-prod | ops | Self-service | prod | — | Julie Winther |
| ws-hr-prod | hr | Self-service | prod | — | Mette Lund |

---
[← 02 People](02-people-operating-model.md) · [Manifest](../README.md) · [Next: 04 Governance →](04-governance.md)
