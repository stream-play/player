# ADR-006 — Remote Metadata

Status: Proposed

## Context

Set remote metadata key, matching and attribution rules.

## Options

- **Opt-in user-keyed metadata::** Opt-in user-keyed metadata enables verified enrichment and attribution but adds rate, privacy, matching and key-storage obligations.
- **Local/provider metadata only::** Local/provider-only metadata avoids external service dependence but limits rich discovery and requires honest empty states.

## Evidence

- v1: `crates/store/src/discovery.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:11` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:244`): “Embedded subtitles, local SRT/VTT/ASS, direct subtitle URLs and optional online subtitle search. Online services may require user configuration/keys; never invent credentials.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:251`): “Themes, trailers and TMDB-based canonical categorization/multiple-source grouping are planned; do not silently replace provider metadata with guessed TMDB matches.”

## Recommendation

Investigate opt-in user-keyed metadata through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

SP-10, SP-14, SP-28.

## Spike/POC needed

None before owner decision; feature job must characterize its domain contract with synthetic fixtures.
