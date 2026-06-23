# Assessment — Struers A/S

| Dimension | Score (1–4) | Note |
|---|---|---|
| 1 Ownership ambition | 2–3 | BI team is described as a "multi-tool" — versatile but stretched. Business domain leads not clearly in the picture yet. Collaboration intent mentioned as a driver, but no dedicated CoE named. Suggest 2 until stakeholder structure is confirmed. |
| 2 Analytics maturity | 2 | Power BI in use but ungoverned ("cowboy land"). OLAP cube is the de-facto truth. No data catalog, unclear ownership. Single CET batch. ~2 on the low side, pending estate size. |
| 3 Engineering capability | 2–3 | SQL competencies confirmed. IoT/real-time need implies some engineering exists (Smart Lab domain). Night jobs run stably. But complex cube logic is a barrier, and DevOps is absent. Mixed — closer to 2 in most domains, 3 in Smart Lab/IoT. |
| 4 Existing estate | 2–3 | Infor ION (ERP on-prem), on-prem SQL Server data warehouse, PBI semantic models on top (ungoverned — 'cowboy land'), MDS, CRM (unnamed). No SSAS cube — semantic models carry the business logic directly. ION cloud migration ~2–3 years is a forcing function. IoT acknowledged but deprioritised. |
| 5 Scale & autonomy | 2–3 | Global footprint (DK + APAC + US at minimum). Multiple domains. M&A adds cross-entity complexity. Exact employee count TBD — Struers is mid-size (~1,000–2,000 est.). |
| 6 Regulatory pressure | 2 | GDPR applies (EU HQ, customer/employee data). No sector regulation confirmed. Roper Technologies (US-listed parent) may impose group-level SOX or audit requirements — TBD. Scored conservatively at 2 until confirmed. |
| 7 Sponsorship & funding | 2–3 | Governance aspiration and "professional not cowboy" cultural framing suggest some exec backing. Version control stated as a requirement — likely CTO/IT leadership driven. Named exec sponsor not yet confirmed. Scored 2–3 pending confirmation. |

**Base archetype:** A2 — Federated Scale-up (assumed; confirm after stakeholder mapping).
**Sovereignty:** standard — GDPR applies; Roper parent compliance TBD.

**Per-domain maturity:**
- sales: self-service (CRM-dependent; strategic insights focus)
- finance: self-service (global close processes; SOX status TBD)
- supply_chain: self-service (access control gaps; shadow IT present)
- smart_lab: engineering-capable (IoT/real-time; product telemetry — confirm)

**Risk flags:**
- SQL warehouse + semantic model logic is complex ('deep in molecules') — inventory before wave 2; no SSAS cube to migrate, but semantic model debt is real
- ION ERP cloud migration (~2–3 years) is a hard source-swap deadline for the ingestion layer; no exact date yet
- DRIFT vs. PROJECT tension — core team is Christoffer (PM), Zirun and Ida (devs); BAU vs. project capacity must be agreed explicitly
- APAC/US time-zone gap on a single CET batch is day-1 pain; incremental/near-real-time required early
- M&A data integration is a non-standard ingestion pattern; scope and frequency unknown
- Roper Technologies parent compliance implications (SOX, audit trail) not yet surfaced — must be clarified
- IoT/Smart Lab: real-time need is acknowledged but explicitly not a wave 1 priority

**Confidence:** Low–Medium. Assessment is based on WS1 board output and post-WS1 Q&A.
Known: stakeholders (Bo, Christoffer, Zirun, Ida), ~400 KW in scope, no SSAS cube, IoT deprioritised.
Still TBD: exact headcount/countries, CRM system, PBI estate size, Roper compliance requirements, ION migration date.

