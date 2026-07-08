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
engineering-capable. Version front-end artefacts too — models and reports in **PBIP + TMDL** so they
diff and review like code — and promote partial deliverables item-by-item rather than whole-workspace.
Instantiate **workspace-per-(domain × env)** from a template and run a clear create → archive lifecycle.
A light gated intake stamps criticality on each workload.

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
| Source format | A1–A3 PBIP + TMDL (diff-able), not PBIX<br>**Other** | _proposed_ | reviewable version control | proposed |
| Front-end branching | A1 trunk/simple<br>A2 feature branch → PR → main<br>A3 feature branch → PR → main, mandatory<br>**Other** | _proposed_ | review before promotion | proposed |
| Front-end environment rigor | A1–A3 dev→test→prod for models; lighter (dev→prod) acceptable for low-risk reports<br>**Other** | _proposed_ | rigor tracks risk | proposed |
| Partial-deliverable promotion | A1 whole-workspace deploy<br>A2 item-level via git + selective deployment<br>A3 item-level via git + selective deployment<br>**Other** | _proposed_ | ship one report/model alone | proposed |
| Deployment-pipeline rules | A1–A3 pipeline rules for data-source rebind + parameter swap across stages<br>**Other** | _proposed_ | clean cross-stage binding | proposed |
| Report / model separation in git | A1 combined acceptable<br>A2 separate models from thin reports<br>A3 separate models from thin reports<br>**Other** | _proposed_ | independent lifecycles | proposed |
| Self-service builds | A1–A3 super-user/self-service builds excluded from prod git flow; live in a sandbox workspace<br>**Other** | _proposed_ | keep self-service out of prod flow | proposed |

---
[← 08 Serving](08-semantic-serving.md) · [Manifest](../README.md) · [Next: 10 Security →](10-security-access.md)
