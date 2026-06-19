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

**Purpose** — decide how models are served to users, certified, and distributed.

## The approach

Default to **Direct Lake** for serving; fall back to import for small or volatile models and DirectQuery
for genuine real-time edge cases. Certify the conformed core centrally; let domains certify their own
products within the standard. Distribute through apps, scoped to how content is owned.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Serving mode | A1–A3 Direct Lake default; import for small/volatile; DirectQuery for real-time edges<br>**Other** | _proposed_ | read OneLake without copies where possible | proposed |
| Certified datasets | A1 central certified<br>A2 central core certified; domains certify their own<br>A3 domain-certified within standard<br>**Other** | _proposed_ | trust signal matches ownership | proposed |
| Report distribution | A1 apps from central<br>A2 per-domain apps + central core<br>A3 domain apps<br>**Other** | _proposed_ | distribution follows ownership | proposed |

---
[← 07 Modelling](07-transformation-modelling.md) · [Manifest](../README.md) · [Next: 09 Engineering →](09-engineering-cicd.md)
