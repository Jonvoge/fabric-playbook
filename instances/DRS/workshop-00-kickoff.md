# WS0 — Kick-off: assessment confirmation & scope (DRS front-end sprint)

> 90 min, day 1. **Not a full playbook assessment** — DRS's back-end is decided and documented in
> their DevOps wiki; this session confirms the draft assessment, ratifies the front-end-only scope,
> and decides where the output lands in **their wiki**.
>
> **Attendees:** DRS BI team lead + platform owner · Jon + Anne (Inspari).
> **Pre-read (send ahead):** [assessment.md](assessment.md) · one-paragraph archetype
> rationale: *"central platform team + super-user self-service on data products = A1 with A2
> practices — do you recognise yourselves?"*

## 1. Assessment confirmation (30 min)

Walk the 7 dimension scores from the draft; confirm or adjust each. Rules:
- Only re-open a score if DRS disagrees — don't re-derive from scratch.
- Back-end scores are **context, not decisions** — nothing back-end gets re-litigated this sprint.
- Confirm archetype: **A1 + A2 practices on Data Products**, sovereignty **standard**.

## 2. Scope ratification (15 min)

| In scope (this sprint) | Explicitly out |
|---|---|
| 07 Semantic-model design | Medallion architecture |
| 08 Serving, report/app structure + writeback | FETA / metadata-driven ingestion |
| 09 Front-end git/CI-CD | Capacity strategy (F64+F16) |
| 10 RLS/OLS | Back-end CI/CD, naming grammar |

## 3. Wiki integration (20 min) — **the deliverable decision**

The sprint output is published in **DRS's DevOps wiki**, not in Inspari's instance folder.

| Decision | Options | Choice | Why |
|---|---|---|---|
| Where front-end material lands | new section under `Fabric-Architecture` · fill the empty "Arbejde med Jan" tree · new top-level "Udviklervejledning – Frontend" · **Other** | | |
| Page structure | mirror playbook pages 07–10 · restructure to DRS's wiki conventions | | |
| Language | Danish (matches wiki) · English | | |
| Wiki ownership post-sprint | named DRS owner per page | | |

## 4. Decision owners (10 min)

| Topic | Ratifier (named person at DRS) |
|---|---|
| 07 Semantic-model design | |
| 08 Serving & apps (+ writeback) | |
| 09 Front-end CI/CD | |
| 10 RLS/OLS | |

## 5. Pilot selection (10 min)

Suggest **Finans** — exercises RLS *and* OLS. Confirm or pick another data product.

## 6. Success criteria & risk flags (15 min)

**Done =** topics 07/08/09/10 at `agreed` · pilot semantic model rebuilt to the standard · **wiki
pages published in DRS's wiki** (not just drafted).

Each risk flag from the assessment gets an owner or an explicit "accepted":

| Flag | Owner / accepted |
|---|---|
| Semantic layer undocumented (the sprint's core gap) | |
| Naming-convention source Excel missing | |
| Open question: naming in PROD? | |
| RLS undefined despite HR/salary/finance PII | |
| No front-end git/CI-CD path | |
| Small team (~7) — governance must stay low-friction | |

## Outputs

- Confirmed assessment + archetype (update [assessment.md](assessment.md); remove the draft banner)
- Ratified scope note · named ratifiers · pilot chosen · wiki landing spot decided
- Then run [workshops.md](workshops.md) WS1–WS7 — every workshop ends by **publishing that day's
  agreed decisions to DRS's wiki**, so the wiki updates continuously rather than big-bang on day 10.
