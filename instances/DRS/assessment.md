# Assessment — Dansk Retursystem

> Initial assessment by Jon Vöge (Inspari), 2026-07-07, from DRS's DevOps wiki and the WIP
> "DRS Fabric Playbook v1". To be confirmed with DRS at sprint kick-off.

| Dimension | Score (1–4) | Note |
|---|---|---|
| 1 Ownership ambition | 2 | Central platform team builds; business domains consume with light super-user self-service. Wiki uses "Data Mesh" language, but ownership is central in practice — not federated engineering teams. |
| 2 Analytics maturity | 2–3 | Back-end medallion is mature and well-documented; **front-end/semantic layer is undocumented and unstructured** (the "Arbejde med Jan" page is empty) — the reason for this engagement. |
| 3 Engineering capability | 3 (platform) / 1–2 (business) | Central team is genuinely engineering-capable: FETA metadata-driven codegen, notebooks, T-SQL warehouse. Business domains are self-service consumers. |
| 4 Existing estate | 3 | 28-source inventory (Navision/BC, CRM/Dataverse, CS Data, RI/Stargate real-time, HRM Easy, SPTID/Lessor salary, Tacho Online, Fleetboard, vehicle-brand APIs, files). Growing. |
| 5 Scale & autonomy | 1–2 | Small team (~7), Denmark-centric (+ Greenland product). Not multi-country autonomous business units. |
| 6 Regulatory pressure | 2 | GDPR on HR, salary (Løn/SP-tid) and finance PII — drives RLS/OLS scope. Not sector-regulated. |
| 7 Sponsorship & funding | 3 | Invested in a prior playbook, two capacities (F64+F16), and consultants. Pooled funding, not chargeback. |

**Base archetype:** A1 — Power BI Moderniser (central platform), with **A2 practices on the Data Products side** (domain-labelled products, super-user self-service build on certified models). Operating model — central ownership, shared capacity, deployment pipelines, pooled funding, central+light-delegated governance — is A1; the wiki's Data Mesh framing is aspirational, not operational.

**Sovereignty:** standard (GDPR applies to HR/salary/finance PII; no sector regulation, no residency constraint beyond ordinary EU handling).

**Per-domain maturity:**
- data_platform: engineering-capable (Integration + Data Modelling; central team)
- data_products: self-service (Operations, Forretningssupport, Business Objects, Cirkulær Økonomi — business consumers + super-user build)

**Risk flags:**
- Semantic-model layer undocumented/unstructured — the core gap this sprint addresses.
- Naming-convention source Excel is missing ("XYZ husk at lave dette"); grammar exists but not its authoritative reference.
- Open playbook question: should naming differ in PROD?
- RLS not yet defined despite HR/salary/finance PII in scope.
- No front-end git/CI-CD path for partial deliverables (only back-end deployment pipelines).
- Small team (~7): any governance added must stay low-friction to survive.

## Scope note

This is a **front-end-only** 2-week sprint (confirmed with Jon). The back-end (architecture, ingestion,
back-end transformation, capacity, back-end CI/CD, naming grammar) is already decided and documented;
those topic pages are left at the DRS as-is and are **not** re-litigated. The sprint makes and persists
decisions on topics **07 (semantic-model design), 08 (semantic serving & report/app structure),
09 (front-end git/CI-CD), 10 (RLS/OLS)**, plus writeback.
