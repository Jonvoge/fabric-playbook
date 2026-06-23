---
id: semantic-serving
topic: "Semantic Serving & Reporting"
owner: "BI Lead — Sarah Lindberg (CoE Lead)"
scope: hybrid
depends_on: [transformation-modelling, governance-classes]
status: agreed
constraints:
  - "Finance semantic model MUST be read-only to all roles except Finance domain and CoE; no self-service editing"
  - "SSAS cube retirement is BLOCKED until all 14 subject areas have a Direct Lake replacement certified"
---

# 8. Semantic Serving & Reporting

> `Owner Sarah Lindberg (CoE Lead / BI Lead)` · `Status agreed` · `Depends on Transformation & Modelling, Governance Classes`

**Purpose** — decide how models are served to users, certified, and distributed.

## The approach

Default to **Direct Lake** for serving; fall back to import for small or volatile models and
DirectQuery for genuine real-time edge cases. Certify the conformed core centrally; let domains
certify their own products within the standard. Distribute through apps, scoped to how content is owned.

The existing Power BI estate (~340 reports, ~65% ungoverned) migrates over three waves. Wave 1 covers
the Central-class core (the SSAS replacement models, certified by CoE). Wave 2 covers Governed-class
domain models per domain. Wave 3 is the self-service sweep: every report currently on the P2 estate
is reviewed and either promoted into a governed workspace or retired. The P2 contract renewal in
September 2026 creates a hard wave 1 deadline: the core models must be live and stable on Fabric
capacity before the contract lapses, so there is no fallback to the old shared capacity.

Finance serving has a special constraint. The Finance semantic model (`sm-finance`) is a Central-class
asset subject to SOX controls. It is read-only to everyone except the Finance team and CoE. Report
authors in Finance do not edit the model; they build reports against a published, certified version.
Auditors get read-only access through a dedicated auditor workspace with no edit permissions.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Serving mode | A1–A3 Direct Lake default; import for small/volatile; DirectQuery for real-time edges<br>**Other** | Direct Lake default; import for small Finance reporting models; DirectQuery not used (A1–A3) | core and domain models read OneLake directly; no import refresh windows for the main models | agreed |
| Certified datasets | A1 central certified<br>A2 central core certified; domains certify their own<br>A3 domain-certified within standard<br>**Other** | Central core certified (sm-core, sm-finance); domains certify their own analytical models (A2) | CoE owns the conformed core; Finance CAB co-approves sm-finance certification | agreed |
| Report distribution | A1 apps from central<br>A2 per-domain apps + central core<br>A3 domain apps<br>**Other** | Per-domain Power BI apps + central core app (A2) | domains own their report suite; central app covers cross-domain KPIs and group reporting | agreed |

## PBI estate migration plan

| Wave | Scope | Target state | Deadline | Owner |
|---|---|---|---|---|
| 1 | Core Central-class models (SSAS replacement) | Certified on Fabric capacity; P2 retired | Aug 2026 (before P2 renewal) | Thomas Bak + Sarah Lindberg |
| 2 | Governed-class domain models (commercial, supply, finance, ops) | Each domain model certified; domain apps published | June 2027 | Domain leads + CoE |
| 3 | Self-service sweep: ~340 reports on old P2 estate | Each report: promoted to governed workspace, or retired | Dec 2027 | Sarah Lindberg (CoE) |

## Report audit register (seed — Sarah Lindberg owns)

| Domain | Reports on P2 | Est. governed | Est. retire | Reviewed |
|---|---|---|---|---|
| Commercial | ~90 | ~60 | ~30 | No |
| Finance | ~75 | ~70 | ~5 | No |
| Supply chain | ~65 | ~50 | ~15 | No |
| Ops excellence | ~55 | ~30 | ~25 | No |
| HR / Corporate | ~35 | ~20 | ~15 | No |
| **Total** | **~320** | **~230** | **~90** | |

---
[← 07 Modelling](07-transformation-modelling.md) · [Manifest](../README.md) · [Next: 09 Engineering →](09-engineering-cicd.md)
