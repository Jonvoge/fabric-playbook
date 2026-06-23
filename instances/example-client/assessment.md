# Assessment — Example Logistics A/S

| Dimension | Score (1–4) | Note |
|---|---|---|
| 1 Ownership ambition | 3 | central CoE (Sarah Lindberg) + 5 domain leads; units want to build within guardrails, not have everything centrally built for them |
| 2 Analytics maturity | 2–3 | Power BI in regular use across all domains; delivery is not governed (~65% of 340 reports ungoverned); SSAS cube is the de-facto truth for commercial + finance |
| 3 Engineering capability | 3 | commercial: strong SQL + Python; supply chain: IoT engineering in-house (Kafka); finance + ops + HR: self-service |
| 4 Existing estate | 3–4 | SSAS Tabular cube (180 measures), MDS master data, 3× SQL Server, Salesforce CRM, Kafka IoT, Workday HRIS, proprietary WMS — large and complex |
| 5 Scale & autonomy | 3 | 9 countries, 2,400 employees, 5 semi-autonomous domains; global footprint with time-zone spread (DK/EU + SG + AU + US) |
| 6 Regulatory pressure | 3 | SOX compliance for Finance (change control, audit trail); GDPR for EU customer and employee PII — not sector-regulated but compliance load is real |
| 7 Sponsorship & funding | 4 | CFO (Marianne Koch) is exec sponsor; dedicated programme budget approved; CTO (Anders Holm) driving DevOps mandate |

**Base archetype:** A2 — Federated Scale-up.
**Sovereignty:** standard (GDPR applies to EU PII; no sector regulation).
**Per-domain maturity:**
- commercial: engineering-capable (SQL + Python team)
- supply_chain: engineering-capable (IoT/Kafka; near-A3 autonomy)
- finance: self-service (SOX-constrained; stricter change control than typical self-service)
- ops: self-service
- hr: self-service

**Risk flags:**
- SOX change control will slow Finance domain deployments — plan for it explicitly
- Supply chain IoT (Kafka) is a real-time requirement, not a future aspiration
- SSAS cube has 14 subject areas and ~180 measures — migration must be catalogued before wave 2
- P2 contract renewal September 2026 is a hard cost deadline (must migrate before, not after)
- Infor ION cloud move 2027-Q4 is a hard technical deadline (source-swap must be validated in wave 2)
