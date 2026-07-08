# Domain Onboarding — <Domain Name>

> Repeatable half-day session, run once per domain (Wave 3) and for **every future domain**. Most
> answers are pre-routed by the domain's `domain_maturity`; the session confirms and captures
> exceptions — it does not start blank. Prerequisite: the Wave 2 cores are `agreed` (edges extend
> cores; no core, nothing to extend).
>
> **Attendees:** domain lead · the domain's analysts/engineers · platform liaison · CoE.
> **Output:** this file filled, in `instances/<client>/domains/<domain>.md`; the domain live on the platform.

## 1. Confirm maturity

Re-run the per-domain checklist ([assessment-kit.md §4](../assessment-kit.md)):

| Check | Y/N |
|---|---|
| Writes its own transformation code (SQL/Python/notebooks) today | |
| Has someone who could own a pipeline in production | |
| Wants to own data products end-to-end (confirmed with domain lead) | |

**`domain_maturity`:** <engineering-capable (all three Y) / self-service>

## 2. Walk the edges

Defaults below are pre-routed by maturity; capture only Choice + Why where the domain deviates.

| Edge decision | Pre-routed default (eng-capable / self-service) | Choice | Why | Status |
|---|---|---|---|---|
| OneLake layout | domain-aligned lakehouse, medallion within domain | | | proposed |
| Workload/experience | lakehouse-first; warehouse if SQL-centric | | | proposed |
| Ingestion tooling | pipelines + notebooks / Dataflows Gen2; mirroring-first for both | | | proposed |
| Semantic models | domain composite models on the conformed core | | | proposed |
| CI/CD rigor | full git flow / deployment pipelines only | | | proposed |
| Workspace conventions | apply the central workspace standard (page 04/09) | | | proposed |
| Curation & endorsement | domain curates + promotes its own products; centre certifies conformed core | | | proposed |
| Data quality | domain owns DQ rules + monitoring for its products | | | proposed |
| Content certification | domain promotes; centre certifies (applies page 04 gates) | | | proposed |
| Enablement track | advanced / guided low-code (page 13) | | | proposed |
| Rollout timing | sequenced by domain readiness (page 13) | | | proposed |

## 3. Instantiate

- [ ] Workspaces created from the workspace-per-(domain × env) template (page 09)
- [ ] Named per the naming standard (page 12)
- [ ] Entra groups created and assigned (page 10)
- [ ] Products registered for curation/certification (page 04)
- [ ] Domain champion named and added to the community (page 13)

**Exit:** workspaces live · products registered · exceptions captured above with a Why each.
