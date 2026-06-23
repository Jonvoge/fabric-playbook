---
id: capacity
topic: "Capacity, FinOps & Reliability"
owner: "Platform Owner — Anders Holm (Head of IT)"
scope: hybrid
depends_on: [operating-model, governance-classes]
status: agreed
constraints:
  - "All capacities MUST be provisioned in North Europe"
  - "Finance production capacity MUST be isolated (SOX audit boundary)"
  - "Supply chain real-time capacity MUST be dedicated and geo-redundant (warehouse ops SLA)"
  - "Fabric capacity MUST be live and stable before September 2026 P2 contract renewal"
---

# 11. Capacity, FinOps & Reliability

> `Owner Anders Holm (Head of IT)` · `Status agreed` · `Depends on Operating Model, Governance Classes`

**Purpose** — size capacity, attribute cost, and set the reliability/DR posture.

## The approach

Capacity strategy follows the operating model and funding posture: one shared capacity when central, a
few by domain cluster when federated, per-domain when mesh. Stand up Capacity Metrics from day one and a
monitoring hub; review spend on a regular cadence. Reliability rests on platform SLAs and OneLake
redundancy; business-critical workloads add geo-redundancy and a tested DR runbook with RPO/RTO targets.

**"Driftsikkerhed"** (operational reliability) is non-negotiable. This means the ERP pipeline and the
core semantic model are classified as business-critical from day one: dedicated capacity isolation,
geo-redundancy, and a written DR runbook — not assumed. Capacity Metrics is configured immediately;
cost visibility is the precondition for the wave-2 move to showback.

> Capacity **sizing** is a calculation, not prose — keep the sizing model as a versioned spreadsheet at
> `instances/example-client/capacity-model.xlsx` and record only the resulting decisions here.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Capacity strategy | A1 one shared<br>A2 2–3 shared by domain cluster, autoscale<br>A3 per domain<br>**Other** | 2 capacities: commercial (F8 + autoscale) and core/shared (F4); reviewed at 6 months (A2) | commercial has variable engineering load; core is steady-state; reviewed as usage matures | agreed |
| FinOps | A1 Capacity Metrics only<br>A2 Metrics + monitoring hub + per-domain dashboards + monthly review<br>A3 chargeback + budgets per domain<br>**Other** | Metrics + monitoring hub + per-domain dashboards + monthly review (A2) | enables showback and future chargeback; precondition for wave-2 cost attribution | agreed |
| Reliability & DR | A1–A3 platform SLAs + OneLake redundancy; business-critical → geo-redundancy + DR runbook + RPO/RTO<br>**Other** | ERP pipeline + core semantic model → geo-redundancy + DR runbook; RPO 4h / RTO 8h (A1–A3 tightened) | "driftsikkerhed" is non-negotiable; RPO/RTO targets confirmed in workshop | agreed |
| Performance | A1–A3 central guardrails (Direct Lake, refresh windows, model best-practice); domains tune<br>**Other** | Central guardrails; CoE reviews model health monthly (A1–A3) | prevent unmanaged dataset sprawl from degrading performance | agreed |

---
[← 10 Security](10-security-access.md) · [Manifest](../README.md) · [Next: 12 Naming →](12-naming-standards.md)
