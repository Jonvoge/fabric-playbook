# How agents use this playbook

The playbook is plain Markdown. Agents read the prose, tables, and diagrams directly — nothing needs to
be re-expressed as JSON. Two roles, both binding.

## 1. Consuming agents (coding / BI assistance during platform work)

1. Read `instances/<client>/org-profile.yaml` — the client you are operating in — and `archetypes.md`.
2. For any topic, open its page and read **The approach** (the judgment) and the **Decisions** table.
3. Honour the page front-matter `constraints:` — these are hard, machine-enforceable rules. Never violate
   one; if you cannot comply, stop and surface it.
4. Act **only** on decisions whose Status is `agreed` or `implemented`. A `proposed` decision is not yet
   ratified — **ask the human; never guess a decision that was not made.**
5. Prefer the structured tables (naming grammar, prefix table, source inventory, per-class items) over
   prose for deterministic facts.

## 2. Authoring agents (helping create/maintain the playbook)

- You may draft prose, fill a decision's Choice/Why, propose table rows, and keep diagrams in sync —
  **via pull request**.
- You may **never** move a decision's Status to `agreed`/`implemented`. Only a human ratifies. Newly
  drafted decisions stay `proposed`.
- When proposing a change to a `constraints:` rule, flag it prominently in the PR.
- Keep page `id`s stable; deprecate-and-supersede, never silently rename.
