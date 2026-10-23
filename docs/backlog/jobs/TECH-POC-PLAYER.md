# TECH-POC-PLAYER — Poc Player

## Goal
Probe HLS and transport-stream playback, track switching, subtitles, hardware decode and persistent sessions with licensed synthetic media. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md; resources/StreamPlay_2_0_Specificaties/bdd/BDD_STRATEGIE.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: ~/Projects/iptv/crates/playback/src/lib.rs (crates/playback/src/lib.rs:20 @ 7469f2a): characterize observable poc player behavior; use synthetic fixtures. Compare staged ~/Projects/iptv/player/crates/playback/src/controller.rs (crates/playback/src/controller.rs:9 @ 869ce22).

## Scope
- In: Probe HLS and transport-stream playback, track switching, subtitles, hardware decode and persistent sessions with licensed synthetic media. Measure failure/reconnect behavior and document codec/licence inventory for ADR-002.
- Out: No production provider integration, real streams or final player backend selection.

## Behavior (BDD)
- Feature file(s): features/live_player.feature
- Scenarios to make pass: DOM-LIVE_PLAYER-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: unavailable capability — probe codec and track fallback; partial error/offline — failed media session

## Domain contract
Indicative PlayerBackend and PlayerSession ports take a synthetic source descriptor, track choice and cancellation token; emit state, error and track events. Session state must survive navigation. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Unsupported codec, missing track, reconnect, device loss, PiP transition, stale session and provider connection limits.

## Acceptance gates
BDD smoke scenarios, unit/adapter tests, fmt, clippy -D warnings, cargo audit and native-library security inventory.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
