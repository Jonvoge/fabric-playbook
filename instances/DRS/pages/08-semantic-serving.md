---
id: semantic-serving
topic: "Semantic Serving & Reporting"
owner: "BI Lead"
scope: hybrid
depends_on: [transformation-modelling, governance-classes]
status: proposed
constraints: []
---

# 8. Semantic Serving & Reporting

> `Owner BI Lead` · `Status proposed` · `Depends on Transformation & Modelling, Governance Classes`

**Purpose** — decide how models are served to users, distributed through apps, refreshed, and endorsed.

## The approach

Serve with **Import** as the default (preference order **Import → Direct Lake → DirectQuery**), reserving
DirectQuery for very large tables. Distribute through **Data Product Workspace Apps**, using **App
Audiences** to differentiate who sees what within a product. Refresh cheaply in DEV (time-parameterised,
few months) and fully in PROD via **Incremental Refresh** with manually refreshable partitions. Endorse
everything centrally built via **Certified**, gated by a **deployment checklist**.

## Decisions

### Serving, storage & refresh

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Storage-mode preference | Import · Direct Lake · DirectQuery | **Import → Direct Lake → DirectQuery** (in that order) | keeps most models simple and fast | proposed |
| DirectQuery scope | none · very large tables · real-time edges | **very large tables** where Import is impractical | DQ only where size genuinely demands it | proposed |
| DEV refresh | full data · **time-parameterised, limited months** | **parameterise on time in DEV → limit number of months** | cheap, fast dev iterations | proposed |
| PROD refresh | full reload · **Incremental Refresh (Live/Hot/Cold) + manual partitions** | **full data via Incremental Refresh with Live/Hot/Cold partitions that can be refreshed manually** | scalable refresh; targeted reprocessing | proposed |

### App structure & distribution

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Report distribution | direct workspace access · **Workspace Apps / Org Apps** | **exhibit reports through Data Product Workspace Apps** (Rec. 2) | keeps the governance seam at access, not workspace sprawl | proposed |
| Audience segmentation | one audience · **multiple App Audiences per workspace** | **use App Audiences to differentiate what is exhibited to whom** (Rec. 3) | granular sharing without granting workspace access | proposed |

### Governance & endorsements

| Decision | Options | Choice | Why | Status |
|---|---|---|---|---|
| Endorsements | none · Promoted · **Certified + endorsement checklists** | **adopt Endorsements + endorsement checklists** | trust signal + a repeatable quality gate | proposed |
| Certified scope | selective · **everything centrally built** | **Certified on all centrally developed artefacts** | central build = the trusted standard | proposed |
| Master Data (future) | — · **use Master Data for back-end on the horizon** | **consider Master Data for back-end over time** | parked as a future direction | proposed |

## Endorsement checklist guideline

When an artefact is deployed, run through the checklist:

- **All checks pass** → apply the endorsement (Certified) to the PROD artefact.
- **One or more Severity 2 checks fail** → **block deployment**.
- **One or more Severity 1 checks fail** → note the gaps and remediate at the next opportunity.

### Report checklist

| Category | Checklist item | Severity |
|---|---|---|
| Layout & Design | Report uses DRS Design Guidelines | 2 |
| Layout & Design | Report uses DRS `.json` Power BI theme | 2 |
| Layout & Design | Only necessary header icons for visuals are active | 1 |
| Layout & Design | Selection pane is clean and consistent with object labels | 1 |
| Accessibility | Visuals layer order is set | 1 |
| Accessibility | Tab order is set | 1 |
| Accessibility | Mobile view works as intended (if applicable) | 1 |
| Accessibility | Contrasts, colours & fonts are accessibility-friendly | 1 |
| Interactivity | Report pages perform as expected (acceptable load times) | 2 |
| Interactivity | All interactions work as expected (slicers, cross-filters, highlights) | 2 |
| Interactivity | Slicers filter (or don't filter) each other correctly | 2 |
| Interactivity | Slicers sync correctly (if applicable) | 2 |
| Interactivity | Pre-defined filters in filter pane are hidden, or filter pane hidden entirely | 2 |
| Documentation | Report has an Information / Help page | 2 |
| Documentation | Info/Help page includes contact information for the report owner | 2 |
| Documentation | Info/Help page includes information about data used in the report | 2 |
| Documentation | Info/Help page includes information about KPI definitions | 2 |
| Data Quality | Key measure / KPI numbers are validated | 2 |
| Data Quality | Detailed numbers are validated | 2 |
| Deployment | Model is associated with a Deployment Pipeline (Dev–Prod) | 2 |
| Deployment | Deployment Pipeline runs successfully | 2 |
| UX / Usability | Is the user able to find answers to the supplied list of questions? | 2 |

### Model checklist

| Category | Checklist item | Severity |
|---|---|---|
| Power Query | Queries are folding (unless otherwise documented — non-folding is a sign transformations should be pushed upstream) | 2 |
| Power Query | Transformations applied could not have been pushed further upstream | 2 |
| Power Query | Unnecessary columns and rows are removed | 2 |
| Power Query | Disable Load for intermediate queries not used in the final model | 2 |
| Power Query | Incremental Refresh configured (if applicable) | 1 |
| Power Query | Check for redundant steps (e.g. multiple rename steps) | 1 |
| Model Objects | Consistent, logical object names (tables, fields, measures) | 2 |
| Model Objects | Tables, columns and measures have a meaningful description | 2 |
| Model Objects | Measures organised into display folders in a separate, disconnected measure table | 2 |
| Model Objects | Measure performance is acceptable | 2 |
| Model Objects | Hide non-reporting and/or technical fields from the field list | 1 |
| Model Objects | Create organised model diagrams for larger models | 1 |
| Documentation | Power Query code is commented | 2 |
| Documentation | DAX measures are commented | 2 |
| Documentation | Model has documentation as a page in the associated `.pbix`/`.pbip`, or clearly linked to an article in DevOps/Teams | 2 |
| Data Quality | Key measure / KPI numbers are validated (incl. different filter combinations) | 2 |
| Data Quality | Detailed numbers are validated (incl. different filter combinations from dimensions) | 2 |
| Publishing | Model is saved and versioned in Teams/SharePoint/OneDrive or GIT | 2 |
| Publishing | Row-Level Security roles tested and validated in the browser | 2 |
| Deployment | Model is associated with a Deployment Pipeline (Dev–Prod) | 2 |
| Deployment | Deployment Pipeline runs successfully | 2 |
| Model Refresh | Model has a refresh schedule | 2 |
| Model Refresh | Data-source credentials are correctly configured in the service | 2 |
| Model Refresh | Gateways (if applicable) are correctly applied | 2 |

---
[← 07 Modelling](07-transformation-modelling.md) · [Manifest](../README.md) · [Next: 09 Engineering →](09-engineering-cicd.md)
