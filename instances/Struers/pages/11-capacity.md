---
id: capacity
topic: "Capacity, FinOps & Reliability"
owner: "Platform Owner"
scope: hybrid
depends_on: [operating-model, governance-classes]
status: proposed
constraints: []
---

# 11. Capacity, FinOps & Reliability

> `Owner Platform Owner` · `Status proposed` · `Depends on Operating Model, Governance Classes`

**Purpose** — size capacity, attribute cost, and set the reliability/DR posture.

## The approach

Capacity strategy follows the operating model and funding posture: one shared capacity when central, a
few by domain cluster when federated, per-domain when mesh. Stand up Capacity Metrics from day one and a
monitoring hub; review spend on a regular cadence. Reliability rests on platform SLAs and OneLake
redundancy; business-critical workloads add geo-redundancy and a tested DR runbook with RPO/RTO targets.

> Capacity **sizing** is a calculation, not prose — keep the sizing model as a versioned spreadsheet at
> `instances/<client>/capacity-model.xlsx` and record only the resulting decisions here.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Capacity strategy | A1 one shared<br>A2 2–3 shared by domain cluster, autoscale<br>A3 per domain<br>**Other** | _proposed_ | cost attribution vs under-utilisation | proposed |
| FinOps | A1 Capacity Metrics only<br>A2 Metrics + monitoring hub + per-domain dashboards + monthly review<br>A3 chargeback + budgets per domain<br>**Other** | _proposed_ | visibility matched to funding posture | proposed |
| Reliability & DR | A1–A3 platform SLAs + OneLake redundancy; business-critical → geo-redundancy + DR runbook + RPO/RTO<br>**Other** | _proposed_ | design for safe change | proposed |
| Performance | A1–A3 central guardrails (Direct Lake, refresh windows, model best-practice); domains tune<br>**Other** | _proposed_ | guardrails over central tuning team | proposed |

---
[← 10 Security](10-security-access.md) · [Manifest](../README.md) · [Next: 12 Naming →](12-naming-standards.md)
