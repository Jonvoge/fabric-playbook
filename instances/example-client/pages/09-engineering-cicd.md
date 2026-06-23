---
id: engineering-cicd
topic: "Engineering & CI/CD"
owner: "Platform Owner"
scope: hybrid
depends_on: [governance-classes]
status: agreed
constraints:
  - "Production deployments MUST go through source control (no portal-only changes to prod)"
  - "Git integration MUST be enabled on all Central-class and Governed-class workspaces from day one"
---

# 9. Engineering & CI/CD

> `Owner Platform Owner` · `Status agreed` · `Depends on Governance Classes`

**Purpose** — set environments, source control, the workspace lifecycle, and the path from idea to production.

## The approach

Separate **dev / test / prod**; business-critical workloads get capacity isolation. Version-control
content and promote through deployment pipelines, with full branch-based git flow where teams are
engineering-capable. Instantiate **workspace-per-(domain × env)** from a template and run a clear
create → archive lifecycle. A light gated intake stamps criticality on each workload.

DevOps and version control are a **stated hard requirement** from the sponsor — non-negotiable. Git
integration is on from day one for all Central and Governed workspaces. The commercial domain, as the
engineering-capable unit, runs full branch-based git flow from the start. Finance and operations use
deployment pipelines with lighter gates and graduate into full git flow as maturity builds.

```mermaid
flowchart LR
  D["dev"] --> T["test"]
  T --> P["prod"]
  D -. "git" .-> Repo[("source control")]
```

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Environments | A1–A3 Pattern 2 (dev/test/prod on shared capacity); business-critical → Pattern 3 (isolated)<br>**Other** | dev/test/prod; ERP pipeline + core semantic model → isolated capacity (A1–A3) | shared capacity for most; ERP pipeline and core model isolated for reliability | agreed |
| CI/CD | A1 deployment pipelines<br>A2 git integration + deployment pipelines<br>A3 full branch-based git flow<br>**Other** | Git integration + deployment pipelines; commercial → full branch-based git flow (A2+) | hard requirement; commercial starts at full git flow; other domains graduate | agreed |
| Workspace lifecycle | A1–A3 workspace-per-(domain × env) from template; create → archive lifecycle<br>**Other** | workspace-per-(domain × env) from template (A1–A3) | predictable, automatable provisioning | agreed |
| Solution intake (SDLC) | A1 central gated<br>A2 light gated; intake stamps criticality<br>A3 domain-autonomous with guardrails<br>**Other** | Light gated; intake stamps criticality (A2) | balance quality gate with delivery speed | agreed |

---
[← 08 Serving](08-semantic-serving.md) · [Manifest](../README.md) · [Next: 10 Security →](10-security-access.md)
