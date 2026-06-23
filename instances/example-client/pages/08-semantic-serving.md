---
id: semantic-serving
topic: "Semantic Serving & Reporting"
owner: "BI Lead"
scope: hybrid
depends_on: [transformation-modelling, governance-classes]
status: agreed
constraints: []
---

# 8. Semantic Serving & Reporting

> `Owner BI Lead` · `Status agreed` · `Depends on Transformation & Modelling, Governance Classes`

**Purpose** — decide how models are served to users, certified, and distributed.

## The approach

Default to **Direct Lake** for serving; fall back to import for small or volatile models and DirectQuery
for genuine real-time edge cases. Certify the conformed core centrally; let domains certify their own
products within the standard. Distribute through apps, scoped to how content is owned.

The large existing Power BI estate migrates over waves: Central-class models are rebuilt first (certified
core replacing the SSAS cube), then Governed-class domain models, then Self-service content is reviewed
and either promoted into a governed workspace or retired. Existing report authors stay in Power BI
Desktop / Service; the Fabric transition is beneath the surface.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Serving mode | A1–A3 Direct Lake default; import for small/volatile; DirectQuery for real-time edges<br>**Other** | Direct Lake default (A1–A3) | core and domain models read OneLake directly; eliminates import refresh windows | agreed |
| Certified datasets | A1 central certified<br>A2 central core certified; domains certify their own<br>A3 domain-certified within standard<br>**Other** | Central core certified; domains certify their own (A2) | CoE owns the conformed core; commercial domain certifies its own analytical models | agreed |
| Report distribution | A1 apps from central<br>A2 per-domain apps + central core<br>A3 domain apps<br>**Other** | Per-domain apps + central core app (A2) | domains own their report suite; central app covers cross-domain KPIs | agreed |

---
[← 07 Modelling](07-transformation-modelling.md) · [Manifest](../README.md) · [Next: 09 Engineering →](09-engineering-cicd.md)
