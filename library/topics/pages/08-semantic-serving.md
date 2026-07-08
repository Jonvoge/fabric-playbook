---
id: semantic-serving
topic: "Semantic Serving & Reporting"
owner: "BI Lead"
scope: hybrid
depends_on: [transformation-modelling, governance-classes]
status: proposed
constraints: []
---

# 8. Semantic Serving & Reporting

> `Owner BI Lead` · `Status proposed` · `Depends on Transformation & Modelling, Governance Classes`

**Purpose** — decide how models are served to users, certified, distributed through apps, and how
users write data back.

## The approach

Default to **Direct Lake** for serving; fall back to import for small or volatile models and DirectQuery
for genuine real-time edge cases. Certify the conformed core centrally; let domains certify their own
products within the standard. Distribute through **apps shaped for consumers** — a landing page and
custom navigation, not a raw workspace listing — scoped to how content is owned. Where users need to
write data back, prefer **native, governed writeback** (User Data Functions / translytical task flows)
landing in a dedicated schema, never mutating source truth.

## Decisions — Serving & storage mode

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Serving mode | A1–A3 Direct Lake default; import for small/volatile; DirectQuery for real-time edges<br>**Other** | _proposed_ | read OneLake without copies where possible | proposed |
| Import fallback | A1–A3 import only for small or highly volatile models<br>**Other** | _proposed_ | avoid needless refresh cost | proposed |
| DirectQuery scope | A1–A3 DirectQuery reserved for genuine real-time edges only<br>**Other** | _proposed_ | reserve DQ; protect capacity | proposed |
| Direct Lake fallback behaviour | A1–A3 allow DQ fallback but monitor frequency<br>**Other** | _proposed_ | protect capacity from surprise DQ | proposed |
| Connection parameterisation | A1–A3 parameter-driven connections across dev/test/prod (no hard-coded IDs)<br>**Other** | _proposed_ | clean promotion across stages | proposed |
| Model / report coupling | A1 model+report together acceptable<br>A2 thin reports on shared certified models<br>A3 thin reports on domain-owned certified models<br>**Other** | _proposed_ | reuse; decouple report changes | proposed |
| Certified datasets | A1 central certified<br>A2 central core certified; domains certify their own<br>A3 domain-certified within standard<br>**Other** | _proposed_ | trust signal matches ownership | proposed |

## Decisions — App structure & navigation

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| App granularity | A1 one/few central apps<br>A2 one app per business area/domain<br>A3 domain-owned apps<br>**Other** | _proposed_ | distribution follows ownership | proposed |
| Workspace → app mapping | A1–A3 one product workspace : one app<br>**Other** | _proposed_ | predictable ownership | proposed |
| Navigation pattern | A1–A3 custom navigation + landing page per app (consumer-shaped, not workspace-shaped)<br>**Other** | _proposed_ | consumer-first access | proposed |
| Content types | A1–A3 report default; paginated for pixel-perfect; scorecard where goals exist<br>**Other** | _proposed_ | fit tool to purpose | proposed |
| Audience management | A1–A3 multiple audiences where one app serves more than one group<br>**Other** | _proposed_ | reduce app sprawl | proposed |
| Workspace layout | A1–A3 folder product workspaces by purpose (models / reports / support)<br>**Other** | _proposed_ | navigable at scale | proposed |

## Decisions — Writeback

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Writeback mechanism | A1–A3 native User Data Functions / translytical task flows; Power Apps or custom only where required<br>**Other** | _proposed_ | native, governed, in-report | proposed |
| Writeback use cases | A1–A3 start from one concrete case; expand deliberately<br>**Other** | _proposed_ | prove the pattern without sprawl | proposed |
| Writeback landing | A1–A3 dedicated writeback table/schema, separate from source truth<br>**Other** | _proposed_ | separate human input from source | proposed |
| Writeback security | A1–A3 Entra-group gated + audit columns (who/when)<br>**Other** | _proposed_ | writeback is a privileged action | proposed |
| Refresh / read-back | A1–A3 defined path for written data to re-appear in the model<br>**Other** | _proposed_ | avoid stale UX | proposed |

---
[← 07 Modelling](07-transformation-modelling.md) · [Manifest](../README.md) · [Next: 09 Engineering →](09-engineering-cicd.md)
