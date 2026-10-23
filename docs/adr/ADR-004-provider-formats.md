# ADR-004 — Provider Formats

Status: Proposed

## Context

Choose the provider formats included at launch.

## Options

- **M3U, Xtream and XMLTV launch support::** M3U, Xtream and XMLTV together preserve provider breadth but expand parser, credential and rights attack surfaces at launch.
- **Stage formats after a smaller M3U slice::** A staged M3U slice reduces initial surface but delays existing users of Xtream/EPG until separately reviewed jobs.

## Evidence

- v1: `crates/providers/src/m3u.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:9` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Investigate m3u, xtream and xmltv launch support through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

`TECH-AUDIT-LEGACY` for live evidence, migration and asset/licence inventory.
