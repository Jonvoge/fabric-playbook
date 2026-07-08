# Question Guide — the workshop script (all archetypes)

> **The word-for-word script for running the sessions.** Confirm the client's archetype from the
> assessment, then read **only that archetype's default line** for each question. Read the *Why*,
> show the *Options*, recommend your archetype's *Default*, capture the choice + a one-line reason +
> an owner **in the topic page named at *Capture***. The ⚑ line applies only if the client is in
> **regulated** mode (set at Q7).
>
> Process, gates, exercises, and capture rules: [facilitation-kit.md](facilitation-kit.md).
> **Archetypes** (`../archetypes.md`): **A1** Power BI Moderniser (central, simple) · **A2** Federated
> Scale-up (autonomy + guardrails) · **A3** Data-Mesh Enterprise (decentralised, engineering-led).

---

# WAVE 0 — Strategy & Direction

### Session 1 · Strategy & Outcomes — *sponsor, CoE/BI lead, unit leaders*

**Q1. What 3–5 measurable outcomes must Fabric deliver?** · *Capture:* [page 01](topics/pages/01-strategy.md)
*Why:* every later decision is settled by "which option best serves these?" *Options:* cut cost · faster insight · more self-service · governance · AI/advanced · retire legacy.
- **A1:** faster insight + self-service for business users + consolidate PBI/reporting + reduce report sprawl.
- **A2:** faster insight + self-service + retire legacy + cost attribution.
- **A3:** data-as-product delivery + domain autonomy at scale + cost transparency + AI enablement + legacy decommission.

**Q2. Is Fabric our single platform, one of several, or just one job?** · *Capture:* [page 01](topics/pages/01-strategy.md)
*Why:* sets consolidation ambition. *Options:* unified · coexistence · single-workload.
- **A1:** unified but **PBI-first** — extend Power BI into Fabric incrementally.
- **A2:** unified — consolidate BI + emerging data engineering.
- **A3:** unified — the backbone for a multi-domain data mesh.

**Q3. Who owns building and running analytics?** · *Capture:* [page 02](topics/pages/02-people-operating-model.md)
*Why:* the most determinative choice; everything follows. *Options:* centralised · managed self-service · federated · mesh.
- **A1:** centralised — a central BI/IT team builds and runs.
- **A2:** federated/hub-and-spoke — central enables, units own products.
- **A3:** data mesh — autonomous domains own products end-to-end.

**Q4. How do we pay for the platform and show each unit's share?** · *Capture:* [page 01](topics/pages/01-strategy.md) (FinOps detail lands on [page 11](topics/pages/11-capacity.md))
*Why:* capacity sizing and cost monitoring depend on it. *Options:* central cost centre · showback · chargeback.
- **A1:** central cost centre (pooled); attribution later if needed.
- **A2:** showback now → chargeback once numbers are trusted.
- **A3:** chargeback — domains own budgets and their capacities.

### Session 2 · Decision Rights & Ownership — *sponsor, CoE, domain leads*

**Q5. Who decides, approves, and settles disputes?** · *Capture:* [page 02](topics/pages/02-people-operating-model.md)
*Why:* unclear authority stalls everything. *Options:* central · CoE-led + delegation · federated.
- **A1:** central authority — IT/BI team + sponsor; light governance body.
- **A2:** exec sponsor + CoE; central holds org-wide, units own their own.
- **A3:** federated governance — domains decide within a thin global standard.

**Q6. Who builds/owns content, and how much self-service?** · *Capture:* [page 02](topics/pages/02-people-operating-model.md)
*Why:* drives domains and tooling. *Options:* business-led · managed self-service · enterprise.
- **A1:** managed self-service with strong central support; enterprise for most content.
- **A2:** managed self-service default; IT owns the core; business-led for mature units.
- **A3:** domain-owned data products are the norm; centre only sets standards.

> **Gate before Wave 1:** is the sponsor engaged and empowered? If not, stop and fix it first.

---

# WAVE 1 — Foundations

### Gate · Residency & Sovereignty — *sponsor/delegate, CoE, legal, platform lead*

**Q7. Where can data live, and which data has extra rules?** *(sets standard vs regulated)* · *Capture:* [page 10](topics/pages/10-security-access.md)
*Why:* the envelope everything is built inside; must precede capacity and security. *Options:* one region + classify all · region list + classify per type · none.
- **A1:** single approved region, light classification, standard mode unless the sector requires otherwise.
- **A2:** approved-region list + classify per data type; standard, escalate specifics to regulated.
- **A3:** approved-region list with per-domain region choice; rigorous classification.

### Workshop A · Platform foundation (decide as one set) — *platform team, CoE, architecture*

**Q8. One Fabric tenant or more?** · *Capture:* [page 05](topics/pages/05-architecture.md)
*Why:* splitting fragments governance and blocks sharing. *Options:* single · multiple.
- **A1 / A2 / A3:** single tenant — handle separation via domains/capacities. Split only for a hard legal/residency wall. *(Convergent across archetypes.)*

**Q9. How many capacities, how big, who pays?** · *Capture:* [page 11](topics/pages/11-capacity.md)
*Why:* drives cost, speed, data region. *Options:* one shared · few by cluster · per domain.
- **A1:** one shared capacity, autoscale on; split only when clearly needed.
- **A2:** 2–3 shared by related domains; split a domain off when usage/cost justifies.
- **A3:** capacity per domain, owned and budgeted by domain teams.
- ⚑ *Regulated:* region-lock each capacity to an approved region.

**Q10. Where do capacities sit in Azure, and how locked-down is the network?** · *Capture:* [page 05](topics/pages/05-architecture.md)
*Why:* security, cost boundaries, Purview placement. *Options:* default public · private endpoints on sensitive paths · dedicated landing-zone subscription.
- **A1:** default public + tenant settings; minimal networking; keep it simple.
- **A2:** dedicated landing-zone subscription (hosts Purview); private endpoints on sensitive paths.
- **A3:** full data-management landing zone; broad private endpoints; central Purview.
- ⚑ *Regulated:* full network isolation regardless of base.

### Workshop B · Security foundation — *platform team, CoE, security*

**Q11. Who controls tenant settings; what's delegated?** · *Capture:* [page 04](topics/pages/04-governance.md)
*Why:* powerful switches; lock-all bottlenecks, delegate-all drifts. *Options:* lock all · baseline + delegate · permissive.
- **A1:** mostly central lockdown; little delegation (few domains).
- **A2:** central baseline; delegate unit-scoped settings; hold security/sharing/export central.
- **A3:** central baseline + broad delegation; domains self-govern within global policy.
- ⚑ *Regulated:* tighten and audit all delegated settings.

**Q12. How do people get access to data and content?** · *Capture:* [page 10](topics/pages/10-security-access.md)
*Why:* federated sharing is only safe with group-based access + default labelling. *Options:* group-based · manual per-item · labels + DLP.
- **A1:** group-based access; RLS where needed; basic labelling.
- **A2:** group-based only; RLS on shared models; labels on by default.
- **A3:** group-based + labels + DLP standard; per-domain security ownership.
- ⚑ *Regulated:* mandatory labelling + DLP + stricter sign-in (conditional access).

---

# WAVE 2 — Shared Standards

### Workshop 2a · Governance — *CoE, platform, governance*

**Q13. How do we group workspaces into domains; who admins them?** · *Capture:* [page 03](topics/pages/03-governance-classes.md)
*Why:* domains organise ownership; align to the business, not source systems. *Options:* by unit/value stream · by source system · few broad.
- **A1:** one or two broad domains (or none initially); central admin.
- **A2:** domains by business unit/value stream; admins from each unit.
- **A3:** many data-product domains; formal per-domain ownership.

**Q14. Who can create workspaces; what's allowed?** · *Capture:* [page 04](topics/pages/04-governance.md)
*Why:* the rulebook (template comes later at Q19/Q31). *Options:* anyone · domain admins only · central only.
- **A1:** central (or a small BI team) creates; tight control.
- **A2:** domain admins create within a central standard.
- **A3:** domains self-provision from templates/IaC within standards.

**Q15. How do we make data findable and mark it trusted?** · *Capture:* [page 04](topics/pages/04-governance.md)
*Why:* no catalog/endorsement = can't tell good from stale. *Options:* Purview + catalog + endorsement · catalog + endorsement only · none.
- **A1:** OneLake catalog + promoted/certified endorsement; Purview later if needed.
- **A2:** Purview + catalog + endorsement, defined centrally; units curate.
- **A3:** full Purview + catalog + lineage + a discovery/marketplace emphasis.
- ⚑ *Regulated:* mandatory classification + lineage.

**Q16. What does "good data" mean; who's responsible?** · *Capture:* [page 04](topics/pages/04-governance.md)
*Why:* quality owned where data is made. *Options:* central team owns · central framework + unit execution · none.
- **A1:** central team owns quality (small scale).
- **A2:** light central framework; each unit owns its rules + monitoring.
- **A3:** domain-owned quality against global SLOs; data contracts between domains.

### Workshop 2b · Platform — *platform, architecture, lead engineers*

**Q17. How is data organised in OneLake; how do units share without copying?** · *Capture:* [page 05](topics/pages/05-architecture.md)
*Why:* copying is costly and drifts; shortcuts reuse one source of truth. *Options:* domain lakehouses + shortcuts · re-copy · mirroring.
- **A1:** a small number of lakehouses (or one medallion workspace); shortcuts where needed; central-managed.
- **A2:** lakehouse per domain (bronze/silver/gold); share via shortcuts; mirror sources; central conformed workspace.
- **A3:** strict domain data products; shortcuts as the sharing contract; mirroring; hard product boundaries.

**Q18. Where does business logic live; what modelling rules?** · *Capture:* [page 07](topics/pages/07-transformation-modelling.md) + [page 08](topics/pages/08-semantic-serving.md)
*Why:* inconsistent definitions won't reconcile. *Options:* central models · unit models · shared core + extensions.
- **A1:** central certified semantic models (PBI strength); few unit models.
- **A2:** certified shared core; units build on top; star schema; Direct Lake where supported.
- **A3:** domain-owned semantic models as products on a thin conformed layer; metric/semantic layer.

**Q19. How do we separate dev/test/prod?** · *Capture:* [page 09](topics/pages/09-engineering-cicd.md)
*Why:* more separation = safer but costlier; can depend on workload criticality. *Options:* the 4 Fabric deployment patterns.
- **A1:** Pattern 2 (separate workspaces, shared capacity); Pattern 1 only for the least-mature.
- **A2:** Pattern 2 standard; Pattern 3 for business-critical.
- **A3:** Pattern 3 (capacity-isolated, production-like) as standard.

**Q20. How is content version-controlled and promoted?** · *Capture:* [page 09](topics/pages/09-engineering-cicd.md)
*Why:* git gives history; rigor depends on skills. *Options:* pipelines only · git + pipelines · full git flow.
- **A1:** deployment pipelines only; git optional.
- **A2:** git for source + pipelines for promotion; full git for engineering units.
- **A3:** full branch-based git flow + IaC, mandatory everywhere.

**Q21. What's our naming standard?** *(derived from Q13/Q9/Q19 — always do it last)* · *Capture:* [page 12](topics/pages/12-naming-standards.md)
*Why:* not a free choice — assembled from the domain map, capacity split, and environments. *Options:* advisory · enforced by template · enforced by policy.
- **A1:** a simple standard, enforced by template (few domains/capacities).
- **A2:** standard assembled from the above, enforced via templates + policy.
- **A3:** strict, comprehensive standard enforced by policy + IaC.

### Workshop 2c · People & ways of working — *CoE, enablement, change lead, domain leads*

**Q22. What roles exist; who's responsible for what?** · *Capture:* [page 02](topics/pages/02-people-operating-model.md)
*Why:* authority was Q5; this is day-to-day execution. *Options:* a few core roles · detailed RACI.
- **A1:** a few central roles (BI developer, admin, consumer); light RACI.
- **A2:** five core roles (product owner, domain admin, platform engineer, steward, consumer); activity-level RACI.
- **A3:** full taxonomy incl. per-domain product owners + platform/enablement teams; detailed RACI.

**Q23. How do we train people, to what level per unit?** · *Capture:* [page 13](topics/pages/13-enablement-adoption.md)
*Why:* mixed levels are normal; approach central, intensity flexes. *Options:* central academy · vendor-led · community · blended.
- **A1:** heavy central enablement — academy + lots of guided/low-code training (the dominant A1 investment).
- **A2:** central academy + role-based paths; low-code units guided, engineering units advanced.
- **A3:** lighter/advanced — communities, self-serve docs, standards adoption.

**Q24. How do people get help; how do we build community?** · *Capture:* [page 13](topics/pages/13-enablement-adoption.md)
*Why:* a single helpdesk doesn't scale. *Options:* helpdesk · champions · community of practice · tiered.
- **A1:** central helpdesk + basic champions; central support heavy.
- **A2:** tiered — central support + unit champions + community of practice + office hours.
- **A3:** community of practice + domain champions + self-serve docs; thin central support.

**Q25. How do we roll out and drive adoption?** · *Capture:* [page 13](topics/pages/13-enablement-adoption.md)
*Why:* big-bang fails in federated/mesh orgs. *Options:* big-bang · phased · pull-based via champions.
- **A1:** phased, guided, comms + training heavy; central-driven push.
- **A2:** phased + pull-based via champions; measure against Q1 outcomes.
- **A3:** pull-based, product-led; domains self-onboard; light central change.

---

# WAVE 3 — Domain Onboarding (run once per domain)

*Capture:* one copy of [templates/domain-onboarding.md](templates/domain-onboarding.md) per domain.

Same nine questions per domain; answers are routed by whether the domain has **its own engineers**
(engineering-capable) or is **more low-code** (self-service). **Archetype only shifts the mix:** in
**A1** most domains route self-service; in **A3** most route engineering-capable; **A2** is genuinely
mixed. (In A1 there may be only one or two domains, so this wave is short.)

- **Q26 Lakehouse layout** → domain lakehouse, bronze/silver/gold, reuse shared data via shortcuts.
- **Q27 Tools (lakehouse vs warehouse)** → lakehouse-first; warehouse if the team is SQL-centric.
- **Q28 Ingestion** → mirroring first; low-code Dataflows (self-service) / pipelines + notebooks (engineering).
- **Q29 Models** → domain models on top of the certified core.
- **Q30 CI/CD rigor** → full git flow (engineering) / pipelines only (self-service).
- **Q31 Workspaces** → follow the central standard; create from the template.
- **Q32 Curation** → domain curates + endorses its own products.
- **Q33 Quality** → domain owns its rules + monitoring.
- **Q34 Training & rollout** → guided (self-service) or advanced (engineering); rollout by readiness.

---

# WAVE 4 — Operations & Lifecycle

### Workshop 4a · Operations — *platform, ops, FinOps owner*

**Q35. How do we watch usage, health, spend?** · *Capture:* [page 11](topics/pages/11-capacity.md)
*Why:* one place for capacity health + per-unit cost, tied to Q4. *Options:* built-in only · + hub · + third-party.
- **A1:** built-in Capacity Metrics + a simple cost view; light FinOps.
- **A2:** central metrics + monitoring hub + per-unit dashboards + monthly review.
- **A3:** full FinOps — per-domain budgets, chargeback dashboards, alerts, optimisation.

**Q36. What backup and recovery do we need?** · *Capture:* [page 11](topics/pages/11-capacity.md)
*Why:* most workloads fine on defaults; critical ones need more. *Options:* platform SLA · + backups · + geo-redundancy & runbook.
- **A1:** platform SLA + redundancy for most; minimal DR.
- **A2:** platform default; business-critical gets geo-redundancy + tested runbook.
- **A3:** DR posture per criticality with tested runbooks broadly; higher baseline.
- ⚑ *Regulated:* documented, tested DR with recovery targets regardless of base.

**Q37. How do we keep things fast and efficient?** · *Capture:* [page 11](topics/pages/11-capacity.md)
*Why:* central guardrails, local tuning. *Options:* ad hoc · guardrails + tuning · central optimisation team.
- **A1:** central guardrails + central tuning (central team optimises).
- **A2:** central guardrails + units tune their own.
- **A3:** central guardrails + domain self-optimisation (+ optional central perf function).

### Workshop 4b · Delivery lifecycle — *platform, CoE, delivery leads*

**Q38. Standard path from idea to production; where is a workload's importance set?** · *Capture:* [page 09](topics/pages/09-engineering-cicd.md)
*Why:* light gates keep quality; intake tags "standard" vs "business-critical", driving Q19 + Q36. *Options:* central gated · unit-autonomous + guardrails · hybrid stage-gate.
- **A1:** light central gated process; central team delivers most; simple intake.
- **A2:** light gated; intake tags importance + owner; rigor by unit skill.
- **A3:** robust SDLC, domain-autonomous within global gates; intake + data contracts + product registration.

**Q39. How do we move off and retire legacy?** *(only if legacy exists)* · *Capture:* [page 14](topics/pages/14-roadmap.md)
*Why:* relevant only if the assessment found legacy to migrate. *Options:* lift-and-shift · re-platform · coexist-then-cutover · decommission-only.
- **A1:** coexist-then-cutover, with a focus on migrating Power BI/legacy reporting content.
- **A2:** per system — run parallel, validate, cut over, decommission; sequence by importance.
- **A3:** re-platform/coexist at scale (often off Synapse/AAS); phased program, sequenced by importance.

---

*39 questions, three archetypes, one regulated overlay. Read your archetype's line, capture the choice
+ reason + owner in the named page. The questions and options never change — only which default line
you read.*
