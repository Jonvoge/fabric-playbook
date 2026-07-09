# Playbook — Dansk Retursystem

| | |
|---|---|
| **Archetype** | A1 (central platform) with A2 practices on the Data Products side |
| **Sovereignty** | standard (GDPR on HR/salary/finance PII) |
| **Last reviewed** | 2026-07-08 |

> **Engagement:** 2-week front-end sprint (Jon Vöge + Anne, Inspari). **Scope = FRONT-END ONLY.**
> Back-end topics (architecture, ingestion, capacity, naming grammar, back-end CI/CD) are decided and
> documented in **DRS's DevOps wiki** — they are not re-litigated and their pages are not carried in
> this instance. The sprint makes and persists decisions on **05, 07, 08, 09, 10, 12** (+ writeback), and
> the ratified output is **published into DRS's wiki** (landing spot decided at WS0).
>
> Engagement spine: [assessment.md](assessment.md) → [workshop-00-kickoff.md](workshop-00-kickoff.md)
> → [workshops.md](workshops.md) (WS1–WS7) → these pages → DRS wiki.
> Facts: [org-profile.yaml](org-profile.yaml).

## Page status

| # | Topic | Status | Sprint scope |
|---|---|---|---|
| 00 | [How to use](pages/00-how-to-use.md) | implemented | — |
| 05 | [Platform Architecture](pages/05-architecture.md) | proposed | workspace/domain topology — central SM workspace, apps, subdomains (WS1/WS3) |
| 07 | [Transformation & Modelling](pages/07-transformation-modelling.md) | proposed | gold → semantic model, design principles, docs (WS1) |
| 08 | [Semantic Serving & Reporting](pages/08-semantic-serving.md) | proposed | serving/storage, apps, refresh, endorsements + checklists (WS2/WS3/WS6) |
| 09 | [Engineering & CI/CD](pages/09-engineering-cicd.md) | proposed | DEV/PROD, versioning, deployment rules — ⚠ constraint relaxed (WS5) |
| 10 | [Security, Access & Residency](pages/10-security-access.md) | proposed | access model + RLS tiers — Finans/HR/Løn (WS4) |
| 12 | [Naming Standards](pages/12-naming-standards.md) | proposed | `SM_[Topic]` semantic-model naming (WS1) |

Out-of-scope topics (01–04, 06, 11, 13–14) are intentionally absent — back-end pages live in DRS's
wiki; strategy/people/enablement are candidates for a future engagement (see the parking lot in
[workshops.md](workshops.md)). Pages 05 and 12 were pulled in mid-sprint to capture the workspace/domain
and naming recommendations that came up in the room.

Archetype reference: [archetypes.md](../../archetypes.md) · Agent rules: [AGENTS.md](../../AGENTS.md)
· Facilitation: [facilitation-kit](../../library/facilitation-kit.md) · Script: [question-guide](../../library/question-guide.md)
