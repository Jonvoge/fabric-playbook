# Workshop plan — DRS front-end sprint

> **Outcomes captured (2026-07-08):** the WS1–WS4 room decisions are now folded into the topic pages as
> `proposed` — see [pages/05](pages/05-architecture.md) (workspace/domain), [07](pages/07-transformation-modelling.md)
> (modelling + docs), [08](pages/08-semantic-serving.md) (serving/refresh/endorsements + checklists),
> [09](pages/09-engineering-cicd.md) (DEV/PROD + versioning — ⚠ constraint relaxed), [10](pages/10-security-access.md)
> (access + RLS tiers), [12](pages/12-naming-standards.md) (`SM_[Topic]`). The recommended-starts below are
> the pre-workshop script; where the room chose differently (e.g. Import over Direct Lake), the **pages are
> authoritative**. Ratify `proposed → agreed` with the owner.

> 2-week engagement (Jon Vöge + Anne, Inspari). **Front-end only.** Back-end (medallion, FETA,
> capacity, back-end CI/CD, naming grammar) is decided and documented — not re-litigated here.
> Each decision below maps to a row in the topic pages; ratify `proposed → agreed` as you go and keep
> [README.md](README.md) in sync. Recommended starts follow the A1(+A2) archetype unless noted.
>
> **Relation to the [question guide](../../library/question-guide.md):** this sprint deliberately skips
> the org-level script (Q1–Q17, Q21–Q39 are back-end/org — decided or out of scope). The overlapping
> questions are covered in more depth here: Q18 → WS1/WS2 · Q15 → WS2 · Q12 → WS4 · Q19/Q20 → WS5.
> WS3 (apps/navigation) and WS6 (writeback) have no guide counterpart — front-end-specific.

## How to run each session

1. Read the decision's **recommended start** aloud → confirm (`agreed`) or change the Choice.
2. Capture a **one-line Why** in the topic page. A write-in is always allowed (**Other**).
3. Never mark `agreed` without the decision-owner in the room. Park anything that needs data you don't have.
4. **End every session by publishing that day's `agreed` decisions to DRS's DevOps wiki** (landing
   spot decided at [WS0](workshop-00-kickoff.md)) — the wiki updates continuously, not big-bang on day 10.

## Sequencing (suggested, 10 working days)

| Day | Session | Page |
|---|---|---|
| 1 | WS0 Kick-off & assessment confirmation | 00 / assessment |
| 2 | WS1 Semantic-model design | 07 |
| 3 | (working session — apply WS1 to a pilot model) | 07 |
| 4 | WS2 Serving & storage mode | 08 |
| 5 | WS3 App structure & navigation (with Anne) | 08 |
| 6 | WS4 Security — RLS / OLS | 10 |
| 7 | (working session — build RLS on the pilot model) | 10 |
| 8 | WS5 Front-end CI/CD & version control | 09 |
| 9 | WS6 Writeback | 08 |
| 10 | WS7 Wrap-up & ratification | README |

---

## WS0 — Kick-off & assessment confirmation

**Objective:** align on scope, archetype, owners, and what "done" means for the sprint.
**Attendees:** DRS BI team lead + platform owner; Jon + Anne.
**Inputs:** [assessment.md](assessment.md), [org-profile.yaml](org-profile.yaml).

| Decision | Options | Recommended start | Why it matters |
|---|---|---|---|
| Archetype confirmation | A1 · A1(+A2 front-end) · other | **A1 + A2 on Data Products** | sets every default below |
| Sprint scope boundary | front-end only · include some back-end | **front-end only** | protects the 2 weeks |
| Decision owners (RACI) | per topic: who ratifies | name a single ratifier per topic | avoids un-owned "agreed" |
| Success criteria | e.g. N topics at `agreed` + pilot model live | **07/08/09/10 agreed + one pilot semantic model rebuilt to standard** | concrete exit |

**Outputs:** confirmed scope note in README; named owners; a pilot data product chosen (suggest **Finans** — it exercises RLS *and* OLS).

---

## WS1 — Semantic-model design (gold → model)

**Objective:** decide where logic lives and how models are shaped on top of the `dm`/gold layer.
**Page:** [pages/07-transformation-modelling.md](pages/07-transformation-modelling.md).
**Inputs:** an existing `dm` view set (Finans); the FETA output for its dims/facts.

| Decision                         | Options                                                                          | Recommended start                                                                | Why it matters                    |
| -------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | --------------------------------- |
| Modelling approach               | import star schema · Direct Lake core + composite · per-domain on certified core | **Direct Lake core** (see WS2)                                                   | reuse vs autonomy                 |
| Logic location                   | in `dm`/gold · in semantic model · in report DAX                                 | **`dm`/gold for shared logic + group-by; thin model; DAX for presentation only** | compute once, not scattered       |
| Aggregation / group-by placement | pre-aggregate in `dm` · aggregate in model · in query/DAX                        | **pre-aggregate in `dm` where reused**                                           | performance + consistency         |
| Fact consolidation               | one wide fact at equal grain · separate facts sharing conformed dims · other     | **separate facts, conformed dims; merge only at identical grain**                | avoids fan-out / wrong totals     |
| Conformed dimensions             | central only · conformed core + domain extensions · federated                    | **conformed core, domains extend**                                               | one Date/Customer/Product, reused |
| Role-playing dimensions          | physical copies · single dim + inactive rels + USERELATIONSHIP · other           | **single dim + role-play (matches FETA roleplay type)**                          | consistent with back-end          |
| Measure standards                | ad-hoc · standard base measures + calculation groups + display folders           | **base measures + calculation groups (time-intel)**                              | maintainable measure layer        |
| Measure naming & folders         | free · convention                                                                | **agree a measure naming + display-folder convention**                           | consumer clarity                  |

**Outputs:** a model-design standard section on page 07; the Finans pilot re-shaped to it.

---

## WS2 — Serving & storage mode

**Objective:** lock the storage-mode strategy and how models bind across environments.
**Page:** [pages/08-semantic-serving.md](pages/08-semantic-serving.md).

| Decision | Options | Recommended start | Why it matters |
|---|---|---|---|
| Default serving mode | Direct Lake · import · DirectQuery | **Direct Lake off Warehouse/`dm`** | no import copies |
| Import fallback criteria | never · small/volatile models · specific list | **small or highly volatile models only** | avoid needless refresh cost |
| DirectQuery scope | none · real-time edges only | **Stargate/Transvision real-time only** | reserve DQ for genuine real-time |
| Direct Lake fallback behaviour | allow DQ fallback · block · monitor | **allow, but monitor fallback frequency** | protect F64 from surprise DQ |
| Connection parameterisation | hard-coded IDs · variable-library / parameter-driven | **parameter-driven across DEV/TEST/PROD** | clean promotion (WS5) |
| Model / report coupling | model+report together · thin reports on shared model | **thin reports on shared certified models** | reuse; decouples report changes |
| Certified vs promoted | none · promoted · certified core | **certify the conformed core; promote domain models** | trust signal matches ownership |

**Outputs:** serving standard on page 08; connection-parameter pattern documented.

---

## WS3 — App structure & navigation (with Anne)

**Objective:** decide how consumers reach content — app granularity, workspace mapping, navigation.
**Page:** [pages/08-semantic-serving.md](pages/08-semantic-serving.md) (app/nav decisions).

| Decision | Options | Recommended start | Why it matters |
|---|---|---|---|
| App granularity | one Org App per business area · one consolidated app w/ sections · hybrid | **one Org App per business area** (Finans, Pantstation, Logistik…) | matches Data Products domains |
| Workspace → app mapping | 1:1 · many workspaces : 1 app | **1 product workspace : 1 app** | predictable ownership |
| Navigation pattern | default list · custom nav pane + landing page | **custom nav + landing page per app** | consumer-first, not workspace-shaped |
| Content types | report only · report + paginated + scorecard | **report as default; paginated for pixel-perfect; scorecard where goals exist** | fit tool to purpose |
| Audience management | single audience · multiple audiences per app | **multiple audiences where one app serves >1 group** | reduces app sprawl |
| Report/app naming (consumer-facing) | technical names · business-friendly names | **business-friendly display names; technical name in git** | consumers ≠ developers |
| Workspace layout for products | flat · foldered by purpose | **folders: models / reports / support** | navigable at scale |

**Outputs:** app + navigation pattern on page 08; a template product workspace layout.

---

## WS4 — Security: RLS / OLS

**Objective:** design row- and object-level security for the sensitive domains.
**Page:** [pages/10-security-access.md](pages/10-security-access.md).
**Inputs:** existing Entra groups (BI_Fabric_DataProducts_*); Finans org/cost-centre structure; Løn/SP-tid data.

| Decision | Options | Recommended start | Why it matters |
|---|---|---|---|
| RLS pattern | static roles → Entra groups · dynamic (USERPRINCIPALNAME + mapping table) · hybrid | **dynamic mapping table for Finans; static where simple** | scales without a role per dept |
| RLS scope — Finans | none · cost-centre / department | **cost-centre / department** | users see only their slice |
| OLS — salary/HR | none · hide salary columns/measures (Løn / SP-tid / Lessor) · separate restricted model | **OLS to hide salary measures; separate model only if OLS insufficient** | column-level PII protection |
| Where security lives | per report · on the shared certified model | **on the certified model, once** | no duplicated RLS logic |
| Entra group → role mapping | ad-hoc · documented mapping table | **documented mapping (group → RLS role)** | auditable |
| Controller / all-access | RLS applies · exempt group | **BI_Fabric_DataProduct_Controller exempt (no RLS)** | matches their existing intent |
| Sensitivity labels | optional · default-on for PII | **default-on for HR/salary/finance** | protection scales with exposure |
| RLS testing | manual · "view as" + test matrix | **test matrix per role, checked at promotion** | prevents leaks after deploy |

**Outputs:** RLS/OLS design + group-mapping table on page 10; RLS built on the Finans pilot.

---

## WS5 — Front-end CI/CD & version control

**Objective:** establish git + promotion for front-end / partial deliverables (models, reports, apps).
**Page:** [pages/09-engineering-cicd.md](pages/09-engineering-cicd.md).
**Inputs:** existing Fabric Deployment Pipelines; current git setup (branches/PR).

| Decision                                | Options                                                             | Recommended start                                                      | Why it matters                       |
| --------------------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------ |
| Git integration on Data Products WS     | none (portal only) · git integration (PBIP/TMDL)                    | **git integration (PBIP/TMDL) on product workspaces**                  | version front-end, not just back-end |
| Format                                  | PBIX · PBIP + TMDL                                                  | **PBIP + TMDL**                                                        | diff-able, review-able               |
| Branching (front-end)                   | trunk · feature branches + PR                                       | **feature branch → PR → main**                                         | review before promotion              |
| Partial-deliverable promotion           | whole-workspace deploy only · item-level via git + selective deploy | **item-level via git + selective deployment**                          | one report/model ships alone         |
| Environments for front-end              | DEV→TEST→PROD for all · lighter for low-risk reports                | **DEV→TEST→PROD for models; DEV→PROD acceptable for low-risk reports** | rigor tracks risk                    |
| Deployment-pipeline rules               | manual · rules + auto-binding                                       | **rules for data-source rebind + parameter swap (ties to WS2)**        | clean cross-stage binding            |
| Report/model separation in git          | combined · separated repos/folders                                  | **separate models from thin reports**                                  | independent lifecycles               |
| Handling super-user self-service builds | in git · excluded                                                   | **excluded from git; live only in a sandbox workspace**                | keep self-service out of prod flow   |

**Outputs:** front-end CI/CD standard on page 09; git connected on the pilot product workspace.

---

## WS6 — Writeback

**Objective:** decide the mechanism, scope and governance for writeback.
**Page:** [pages/08-semantic-serving.md](pages/08-semantic-serving.md) (writeback decision).

| Decision | Options | Recommended start | Why it matters |
|---|---|---|---|
| Mechanism | Fabric User Data Functions / translytical task flows · Power Apps · custom | **User Data Functions / translytical** | native, governed, in-report |
| Use cases in scope | list the real ones (e.g. comments, approvals, manual adjustments) | **start with 1 concrete case** | proves the pattern without sprawl |
| Where written data lands | dedicated writeback table/schema · source system | **dedicated writeback schema in Warehouse** | separates human input from source truth |
| Security on writeback | open · Entra-group gated + audited | **Entra-group gated + audit column (who/when)** | writeback is a privileged action |
| Refresh / read-back | manual · triggered | **agree how written data re-appears in the model** | avoids stale UX |

**Outputs:** writeback pattern on page 08; one pilot use case specified.

---

## WS7 — Wrap-up & ratification

**Objective:** ratify, document, hand over.

| Activity | Output |
|---|---|
| Walk every `proposed` decision from WS1–WS6 | mark `agreed` (or park with a reason) |
| Update [README.md](README.md) page-status table | statuses reflect reality |
| Confirm pilot (Finans) meets the new standards | reference implementation for the team |
| Parking lot review | see below |
| Handover / enablement note | short "how we work front-end now" for the team |

### Parking lot (raised but out of sprint scope)

- **Naming source Excel is missing** ("XYZ husk at lave dette") — recreate the authoritative reference (page 12).
- **Open question: should naming differ in PROD?** — decide and document (page 12).
- Porting DRS wiki back-end content into pages 05/06/11/12 if a single source of truth is later wanted.
- Enablement & adoption (page 13) for business super-users — future engagement.

---
[Assessment](assessment.md) · [Org profile](org-profile.yaml) · [Manifest](README.md)
