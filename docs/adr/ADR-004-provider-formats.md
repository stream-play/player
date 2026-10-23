# ADR-004 — Provider Formats

Status: Proposed

## Context

Choose the provider formats included at launch.

## Options

The v1 provider snapshot includes M3U, Xtream and XMLTV modules; the choice is launch scope, not whether those formats ever existed.

- **M3U, Xtream and XMLTV launch support:** M3U, Xtream and XMLTV together preserve provider breadth but expand parser, credential and rights attack surfaces at launch.
- **Stage formats after a smaller M3U slice:** A staged M3U slice reduces initial surface but delays existing users of Xtream/EPG until separately reviewed jobs.

## Evidence

- v1: `crates/providers/src/m3u.rs:121 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:9` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Prefer **M3U, Xtream and XMLTV launch support**. All three formats have v1 provider implementations, so this preserves existing import breadth while requiring parser and security tests for each. This remains a proposal for owner decision.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

None: the listed decision can use the legacy audit and owner-provided evidence; no separate technical POC is required.
