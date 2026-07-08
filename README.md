# Fabric Playbook

A template for producing a **bespoke** Microsoft Fabric playbook for a client. The reusable judgment
lives once in the **library**; each engagement copies it into an **instance** and fills in the choices.
Authored in Markdown + diagrams so it lives in Git or a wiki and is read by people and agents alike.

> This is not a one-size blueprint. It is a **library of opinionated, archetype-keyed defaults** that you
> tailor into one client's playbook. The tailoring is the point.

## The model

**Pages are the unit.** Each topic is one page: a topic name, a thin strip of codified properties
(owner, scope, dependencies), then the meat — prose, graphics, a decisions table, and any supplementary
tables. Sections flex per topic; a page uses what it needs.

**Two layers.**
- `library/` — the reusable topic templates. Each carries the prose, the diagrams, and the **archetype
  defaults** (A1 / A2 / A3) for every decision. You edit these rarely.
- `instances/<client>/` — one client. Copy the library pages here and fill the decisions tables. The
  filled pages **are** the deliverable. There is no separate build step.

**Archetypes set the starting defaults.** A short assessment places the client on one of three
archetypes (see `archetypes.md`) plus an optional `regulated` overlay. The archetype pre-fills every
decision's default so a workshop **reacts and adjusts** rather than starting blank.

**Decisions are a table.** Columns: `Decision | Options | Choice | Why | Status`. The Options cell lists
the A1/A2/A3 defaults (one per line) and always ends with **Other** — a write-in is always available.
Where the archetypes agree, the cell shows `A1–A3 <value>` so the agreement is visible. The Choice
records what was picked (and which archetype it matched); drift from the default is visible on its face.

## How to run an engagement

1. Assess the client → archetype + per-domain maturity + any `regulated` flag (`archetypes.md`).
2. Copy `library/topics/pages/*` into `instances/<client>/pages/`; set `instances/<client>/org-profile.yaml`.
3. In each workshop, walk the decisions table: read the archetype default, confirm (→ `agreed`) or
   change the Choice (write-in if none fit), capture a one-line Why.
4. Fill the supplementary tables (source inventory, naming grammar, capacity sizing, …).
5. The filled pages are the published playbook.

## How agents read it

See `AGENTS.md`. In short: agents read the prose and tables directly; they treat the front-matter
`constraints:` as hard rules, act only on decisions at `agreed`/`implemented`, and **ask rather than
guess** when something is `proposed`.

## Structure

```
README.md                 this file
AGENTS.md                 how agents consume & co-author
archetypes.md             A1/A2/A3 + the regulated overlay
library/
  templates/topic-page.md the clean skeleton — copy to start a new topic
  templates/               reusable file templates (org-profile.yaml, assessment.md, domain-onboarding.md, instance-readme.md)
  topics/pages/           the ~15 topic templates (00–14)
  topics/diagrams/        reusable concept diagrams (SVG)
instances/
  example-client/         a worked example instance
```
