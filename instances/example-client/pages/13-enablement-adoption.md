---
id: enablement-adoption
topic: "Enablement & Adoption"
owner: "CoE Lead — Sarah Lindberg"
scope: hybrid
depends_on: [operating-model]
status: agreed
constraints: []
---

# 13. Enablement & Adoption

> `Owner Sarah Lindberg (CoE Lead)` · `Status agreed` · `Depends on Operating Model`

**Purpose** — set how people are trained, supported, and brought along.

## The approach

Build enablement as role-based learning paths delivered through a central academy, with intensity
tuned per domain. Support is tiered: central platform support behind domain champions and a community
of practice. Drive adoption in phases, pulled by champions, measured against strategy outcomes.

The maturity split is sharp and matters for design. Commercial and supply chain users need advanced
Fabric, git, and pipeline skills — they are running production data products. Finance users need
confident Power BI authoring and the discipline to follow the SOX-compliant change process (no
side-stepping the Finance CAB). Ops and HR users need guided self-service: they should know what
Dataflow Gen2 can do, and more importantly when to ask for CoE help instead of building it themselves.

Champions are identified and onboarded in wave 1 before any domain goes live. The champion carries
the L1 support load in their domain; the CoE handles L2/L3. Office hours run weekly in wave 1
(every Thursday), bi-weekly from wave 2 onward. Adoption is measured against the strategy outcomes
register (page 01), not against training completion rates.

## Decisions

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Enablement | A1 central academy + strong support<br>A2 central academy + role-based paths; per-domain intensity<br>A3 advanced, largely self-driven per domain<br>**Other** | Central academy + role-based paths; 5 tracks, per-domain intensity (A2) | commercial + supply chain need advanced engineering track; finance needs SOX-process track; ops + HR need guided self-service | agreed |
| Community & support | A1–A3 tiered: central L2/L3 + domain champions L1 + community of practice + office hours<br>**Other** | Tiered support (A1–A3) | 5 domain champions carry L1; CoE handles escalations; office hours weekly in wave 1 | agreed |
| Change & adoption | A1 phased central<br>A2 phased + pull-based via champions<br>A3 per-domain rollout sequencing<br>**Other** | Phased + pull-based via champions; measured against outcomes register (A2) | champions pull adoption; strategy outcomes O1–O5 are the adoption metrics, not training KPIs | agreed |

## Learning tracks

| Domain | Track | Focus | Format | Wave |
|---|---|---|---|---|
| Commercial (Katrine M.) | Advanced engineering | Fabric notebooks, pipelines, git flow, Direct Lake models | Hands-on workshops + self-paced | 1 |
| Supply chain (Rasmus D.) | Advanced + IoT | Eventstream, KQL, real-time analytics, git flow | Hands-on workshops + pairing | 1 |
| Finance (Henrik S.) | SOX-safe authoring | Power BI report authoring, CAB process, read-only model usage | Guided workshops | 1 |
| Ops excellence (Julie W.) | Guided self-service | Dataflow Gen2, report authoring, when to escalate | Guided workshops | 2 |
| HR / Corporate (Mette L.) | Guided self-service | Power BI reports, Workday data literacy, GDPR awareness | Self-paced + office hours | 2 |

## Champion register

| Domain | Champion | Role | Onboarding wave | Status |
|---|---|---|---|---|
| Commercial | Katrine Møller (Domain lead) | Product owner + L1 support | 1 | proposed |
| Supply chain | Rasmus Dahl (Domain lead) | Product owner + L1 support | 1 | proposed |
| Finance | Henrik Sørensen (Domain lead) | SOX process owner + L1 support | 1 | proposed |
| Ops excellence | Julie Winther (Domain lead) | L1 support + self-service coach | 2 | proposed |
| HR / Corporate | Mette Lund (Domain lead) | L1 support + GDPR liaison | 2 | proposed |

---
[← 12 Naming](12-naming-standards.md) · [Manifest](../README.md) · [Next: 14 Roadmap →](14-roadmap.md)
