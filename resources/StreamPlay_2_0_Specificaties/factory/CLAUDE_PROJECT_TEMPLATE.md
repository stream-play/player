# Voorbeeld: project `CLAUDE.md` voor StreamPlay 2.0

> Kopieer onderstaande inhoud na eigenaarreview naar de **nieuwe projectrepo** als `CLAUDE.md`. Alleen concrete repo-paths en echte factory-integraties aanpassen.

```markdown
# StreamPlay 2.0 — Agent Instructions

## Source of truth
- Product/schermen: docs/specifications/schermen/SP-*.md (pas echte paden aan)
- Style/build: docs/specifications/guides/BUILD_EN_STYLE_GUIDE.md
- Architecture: docs/specifications/guides/TECHNISCHE_ARCHITECTUUR.md
- BDD: docs/specifications/bdd/BDD_STRATEGIE.md
- Decisions: docs/adr/ (accepted ADRs override proposals in initial docs)

## Non-negotiables
1. Rust rewrite from scratch; legacy Rust repo is read-only behavior reference.
2. Never change public behavior without adding/updating BDD scenarios first.
3. No unapproved architecture, player, GUI, licensing, provider, data-loss or scope decisions.
4. Asap Sharp, ProIcons and three theme presets; no inline hardcoded theme values.
5. Every UI has empty/loading/error/keyboard/reduced-motion states.
6. Keep playback core independent from layout; protect player session across route changes.
7. Secrets via OS keystore; no credentials in code/logs or docs.
8. Work in assigned factory branch/worktree only; do not merge your own PR without gates.

## Per-job execution
Read assignment, all relevant screen docs and accepted ADRs. Write or update Gherkin, demonstrate red state, implement smallest safe solution, run fmt/clippy/test/BDD, update docs, submit PR and evidence. Report blockers and deviations immediately. Do not invent functionality based on AI screenshots.

## Review checklist
Behavior/BDD, Rust correctness, security/privacy, performance on large libraries, a11y, all themes, responsive viewport, source provenance, data migration, player capabilities, licensing, install/run.

## Communication
Use explicit assumptions; ask owner only when a blocked ADR/approval is necessary. Technical spikes before irreversible choices. Summarize verified results and remaining risks.
```

## Factory configuratie-notitie
De orchestrator gebruikt standaard Claude Code. Codex of andere agents kunnen op project- of jobniveau ingezet worden zonder productcontract te veranderen. Beschrijf selectie van model per reviewrol expliciet, maar ga niet uit van aanwezige connectors, secrets, CLI of toolnamen die niet bevestigd zijn.
