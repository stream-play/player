# ADR-002 — Video Backend

Status: Proposed

## Context

Choose the playback backend and licensing/codec approach.

## Options

- **libmpv::** libmpv preserves v1 codec and track behavior but requires an explicit native-library licence and update inventory.
- **GStreamer or platform-native video::** GStreamer/platform backends may ease some platform integration but need format/track parity probes and distinct packaging.

## Evidence

- v1: `crates/playback/src/lib.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/playback/src/controller.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:7` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:38`): “GPL-3.0-or-later and policy Markdown files are already established in the public repo. Do not reopen the licensing discussion.”

## Recommendation

Investigate libmpv through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

`TECH-POC-PLAYER` for codecs, tracks, sessions and rights.
