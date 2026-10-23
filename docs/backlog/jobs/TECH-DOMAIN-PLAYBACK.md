# TECH-DOMAIN-PLAYBACK — Domain Playback

## Goal
Publish player state, session, track, subtitle, PiP and error ports after ADR-002. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md; resources/StreamPlay_2_0_Specificaties/schermen/05_05_Live_TV_player.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: `~/Projects/iptv` (`crates/playback/src/lib.rs:257 @ 7469f2a`): characterize the observable behavior; use synthetic fixtures. Compare staged `crates/playback/src/controller.rs:9 @ 869ce22`.

## Scope
- In: Publish player state, session, track, subtitle, PiP and error ports after ADR-002. Provide fake backend and lifecycle tests so navigation can retain one session.
- Out: No production screen UI or unsupported recording/DRM claims.

## Behavior (BDD)
- Feature file(s): features/live_player.feature
- Scenarios to make pass: DOM-LIVE_PLAYER-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path — satisfy the listed invariant; boundary data — verify IDs and conflicts; partial error/offline — retain valid state

## Domain contract
Indicative PlayerBackend/PlayerSession ports use stable source ID, track selection and state events. A player session is independent of a screen component; unsupported capabilities are explicit. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Track disappears, reconnect cap, audio-only stream, cancellation and concurrent session focus.

## Acceptance gates
Live-player BDD, backend contract tests, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
