# TECH-DOMAIN-PLAYLIST — Domain Playlist

## Goal
Define playlist/provider identity, credential references, enabled state and sync result contract for M3U/Xtream. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/schermen/24_24_Playlists_providers.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: `~/Projects/iptv` (`crates/providers/src/m3u.rs:121 @ 7469f2a`; `crates/providers/src/xtream.rs:92 @ 7469f2a`; player `crates/providers/src/m3u.rs:5 @ 869ce22`): characterize the observable behavior; use synthetic fixtures.

## Scope
- In: Define playlist/provider identity, credential references, enabled state and sync result contract for M3U/Xtream. Specify bounded untrusted input and idempotent refresh behavior.
- Out: No real credentials, production network call or screen UI.

## Behavior (BDD)
- Feature file(s): features/playlist_import.feature
- Scenarios to make pass: DOM-PLAYLIST_IMPORT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path — satisfy the listed invariant; boundary data — verify IDs and conflicts; partial error/offline — retain valid state

## Domain contract
Indicative PlaylistRepository and ProviderImporter ports use Playlist UUID, providerType and credentialRef. Secrets remain keystore references; SourceItem identity is (playlistId, providerItemId); refresh is idempotent. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Malformed/oversized input, duplicate entries, revoked credential and failed refresh retaining prior catalogue.

## Acceptance gates
Playlist-import BDD, parser/property and integration tests, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
