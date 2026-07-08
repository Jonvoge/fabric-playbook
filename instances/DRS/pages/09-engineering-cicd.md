---
id: engineering-cicd
topic: "Engineering & CI/CD"
owner: "Platform Owner"
scope: hybrid
depends_on: [governance-classes]
status: proposed
constraints:
  - "Production deployments MUST go through source control (no portal-only changes to prod)"
---

# 9. Engineering & CI/CD

> `Owner Platform Owner` · `Status proposed` · `Depends on Governance Classes`

**Purpose** — set environments, source control, the workspace lifecycle, and the path from idea to production.

## The approach

Separate **dev / test / prod**; business-critical workloads get capacity isolation. Version-control
content and promote through deployment pipelines, with full branch-based git flow where teams are
engineering-capable. Instantiate **workspace-per-(domain × env)** from a template and run a clear
create → archive lifecycle. A light gated intake stamps criticality on each workload.

```mermaid
flowchart LR
  D["dev"] --> T["test"]
  T --> P["prod"]
  D -. "git" .-> Repo[("source control")]
```

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Environments | A1–A3 Pattern 2 (dev/test/prod on shared capacity); business-critical → Pattern 3 (isolated)<br>**Other** | _proposed_ | safe change without over-provisioning | proposed |
| CI/CD | A1 deployment pipelines<br>A2 git integration + deployment pipelines<br>A3 full branch-based git flow<br>**Other** | _proposed_ | rigor tracks engineering maturity | proposed |
| Workspace lifecycle | A1–A3 workspace-per-(domain × env) from template; create → archive lifecycle<br>**Other** | _proposed_ | predictable, automatable provisioning | proposed |
| Solution intake (SDLC) | A1 central gated<br>A2 light gated; intake stamps criticality<br>A3 domain-autonomous with guardrails<br>**Other** | _proposed_ | quality without slowing teams | proposed |

---
[← 08 Serving](08-semantic-serving.md) · [Manifest](../README.md) · [Next: 10 Security →](10-security-access.md)
