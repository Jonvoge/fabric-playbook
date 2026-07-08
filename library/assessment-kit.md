# Assessment Kit — placing a client on an archetype

> How to run the assessment that precedes every playbook engagement. Output: a filled
> [`templates/assessment.md`](templates/assessment.md) + `org-profile.yaml` — archetype hypothesis,
> `domain_maturity` per domain, `sovereignty` hypothesis, sponsorship flag, risk flags. These are the
> **prerequisites for Wave 0** (see [facilitation-kit.md](facilitation-kit.md)); the client confirms
> the hypothesis in the room, they don't see the scoring mechanics.
>
> Format: ~1 week, mostly async — 2–4 stakeholder interviews (sponsor, BI/platform lead, one or two
> domain leads) + an estate review (tenant, wiki/docs, source inventory). Score as you go; reconcile at the end.

## 1. Interview questions per dimension

Ask open questions; map answers to the rubric afterwards. Don't read scores aloud.

**1 — Ownership ambition** *(who should build?)*
- When a business unit needs a new report or data product today, who builds it?
- Who *should* build it in three years — and does the business unit agree with that answer?
- Is there appetite (and headcount) in the units to own data products, or do they want to consume?

**2 — Analytics maturity** *(how governed is delivery?)*
- What share of reports/models in production went through any review or certification?
- What is the de-facto "source of truth" people trust — a governed model, a cube, or someone's Excel?
- Is the back-end (warehouse/lakehouse) documented? Is the front-end (models, reports)?

**3 — Engineering capability** *(who can write code?)*
- Does the central team write pipelines/notebooks/SQL, or configure low-code tools?
- Which business units have their own SQL/Python/engineering people? (Score central and per-unit separately — this often splits.)
- Is there any existing CI/CD or git practice, anywhere?

**4 — Existing estate** *(what must be carried or killed?)*
- Inventory the sources: count them, name the legacy platforms (SSAS, MDS, on-prem SQL, SaaS APIs).
- What is contractually or technically dated? (renewals, cloud moves, end-of-support)
- How much existing Power BI content exists, and is any of it certified?

**5 — Scale & autonomy** *(how big, how federated?)*
- Countries, employees, time zones?
- How many business units act autonomously today (own budgets, own analysts)?
- Is federation an organisational reality or an aspiration in a strategy deck?

**6 — Regulatory pressure** *(what tightens the defaults?)*
- Sector regulation (finance/health/public)? SOX-style change control? Residency obligations?
- Where does PII live — HR, salary, customer, finance?
- Has audit/compliance ever blocked or reshaped a data project here?

**7 — Sponsorship & funding** *(will decisions stick?)*
- Who is the executive sponsor, by name? Have they committed budget or only interest?
- Has the org invested before (capacities, consultants, a prior playbook)?
- Funding posture: pooled central cost, showback, or chargeback ambition?

## 2. Scoring rubric (1–4 per dimension)

| Dim | 1 | 2 | 3 | 4 |
|---|---|---|---|---|
| 1 Ownership ambition | central builds everything, units want it that way | central builds, light super-user self-service | units want to build within guardrails | units demand full product ownership |
| 2 Analytics maturity | ad-hoc Excel/report sprawl, nothing governed | pockets of governed delivery; key layers undocumented | regular governed use; majority still uncertified | governed delivery is the norm; certification works |
| 3 Engineering capability | no engineering; low-code only | central team competent; business none | strong central + 1–2 capable units | engineering distributed across most units |
| 4 Existing estate | greenfield / trivial | a handful of sources, one legacy system | large mixed estate (15+ sources, legacy platforms) | very large/complex, multiple legacy platforms + hard deadlines |
| 5 Scale & autonomy | one country, small team, no autonomous units | mostly central, limited autonomy | multi-country or several semi-autonomous domains | global, many autonomous units, FinOps pressure |
| 6 Regulatory pressure | none beyond baseline GDPR | GDPR PII scope drives RLS/OLS but no sector regime | compliance regime with audit/change control (e.g. SOX) | sector-regulated: residency, isolation, auditability dominate |
| 7 Sponsorship & funding | no named sponsor, no budget | interested sponsor, unconfirmed budget | committed sponsor, budget approved, pooled funding | exec mandate + programme budget + attribution ambition |

## 3. Score → archetype heuristic

The determinative dimensions are **1 (ownership), 3 (engineering), 5 (scale)**. The others colour the
profile and set flags but don't pick the base.

| Pattern on dims 1 · 3 · 5 | Base |
|---|---|
| All ≤ 2 | **A1 — Power BI Moderniser** |
| Dim 1 or 5 at 3+, dim 3 at 3 (strong centre, some capable units) | **A2 — Federated Scale-up** |
| All ≥ 3, dim 3 at 4, FinOps-conscious (dim 7 at 4) | **A3 — Data-Mesh Enterprise** |

- **Overlay:** dim 6 = 4 → `sovereignty: regulated` on top of the base. Dim 6 = 3 → standard, but
  carry the compliance regime as a risk flag and expect tightened choices in security/CI-CD pages.
- **Splits are normal.** A central-A1 org with A2 ambitions on the product side is a real profile —
  record it as "A1 with A2 practices on <area>" rather than forcing one box. The archetype pre-fills
  defaults; a hybrid just means two default columns apply.
- **Mismatch warning:** if the client's language says mesh/federated but dims 1/3 score ≤2, the
  operating model is central in practice — score the practice, note the aspiration as a risk flag.

## 4. Per-domain maturity checklist

Per domain, `engineering-capable` requires **all three**; otherwise `self-service`:

1. Writes its own transformation code (SQL/Python/notebooks) today — not just Power Query.
2. Has at least one person who could own a pipeline in production (on-call, debugging, releases).
3. Wants to own data products end-to-end (checked with the domain lead, not assumed).

Re-run this checklist whenever a new domain onboards (see
[templates/domain-onboarding.md](templates/domain-onboarding.md)).

## 5. Risk-flag prompts

Always probe these five categories; each flag gets an owner or an explicit "accepted" at kick-off:

- **Hard deadlines** — contract renewals, licence expiries, source-system cloud moves, audits. Date them.
- **Legacy estate** — anything that must be catalogued before a migration wave (cube measures, MDS entities, report inventories).
- **Undocumented / unowned layers** — the gap usually *is* the engagement; name it precisely.
- **Sponsorship** — weak sponsor = the playbook stalls in arbitration. Flag amber/red honestly.
- **Team size / friction budget** — small teams can't carry heavy governance; note the ceiling.

## 6. Outputs & definition of done

Copy [`templates/assessment.md`](templates/assessment.md) into `instances/<client>/assessment.md` and fill:

- [ ] All 7 dimensions scored with a one-line evidence note each
- [ ] Base archetype + any hybrid note
- [ ] `sovereignty` hypothesis (confirmed later at the Wave 1 residency gate)
- [ ] `domain_maturity` per known domain
- [ ] Sponsorship flag (green/amber/red)
- [ ] Risk flags, dated where possible
- [ ] Scope note (full playbook vs partial engagement)
- [ ] `org-profile.yaml` filled alongside (facts: org, domains, sources, stakeholders, constraints)

Then scaffold the instance (`new-instance.ps1`) and proceed to Wave 0 in the
[facilitation-kit.md](facilitation-kit.md).
