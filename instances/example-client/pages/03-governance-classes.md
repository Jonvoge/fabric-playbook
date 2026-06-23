---
id: governance-classes
topic: "Governance Classes & Workspace Model"
owner: "Platform Owner"
scope: platform-invariant
depends_on: [operating-model]
status: agreed
constraints:
  - "Every workspace MUST be assigned exactly one governance class"
---

# 3. Governance Classes & Workspace Model

> `Owner Platform Owner` · `Status agreed` · `Depends on Operating Model`

**Purpose** — set the workspace classes that decide the playing rules: which items are allowed, who creates them, and how much rigor applies.

![Governance class strictness gradient](../diagrams/governance-gradient.svg)

## The approach

This is the **pivotal axis** — decided early, because most later pages key their rules to it. Three
classes match the federated model: **Central** (core platform, full CI/CD, maximum rigor), **Governed**
(domain-owned products under CoE-approved guardrails), and **Self-service** (fenced exploration and
business-led reporting).

The *governed* tier is the key investment here — it converts the current Power BI sprawl into a
structure that is auditable and sustainable without forcing everything through the central team. Existing
ungoverned reports either graduate into a governed workspace or are retired.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| How many classes | A1 two (central + self-service)<br>A2 three (+ governed)<br>A3 three–four (+ sandbox)<br>**Other** | Three — Central / Governed / Self-service (A2) | governed tier converts PBI sprawl into structured domain products | agreed |
| Class assignment | A1–A3 one class per workspace, set at creation<br>**Other** | One class per workspace, set at creation (A1–A3) | unambiguous rules per workspace | agreed |
| Rigor gradient | A1 light<br>A2 rising toward central<br>A3 thin global + domain self-gov<br>**Other** | Rising toward Central (A2) | enforcement tracks the federated model | agreed |

## Per-class model

| Dimension | Central | Governed | Self-service | Detailed on |
|---|---|---|---|---|
| Allowed items | narrow | broader | broadest | 04 Governance |
| Creation rights | platform team | domain leads | business | 02 People |
| CI/CD | full gated | lighter gates | optional | 09 Engineering |
| Certification | mandatory | encouraged | not required | 04 Governance |
| Access | tight groups | scoped groups | broad within fence | 10 Security |

---
[← 02 People](02-people-operating-model.md) · [Manifest](../README.md) · [Next: 04 Governance →](04-governance.md)
