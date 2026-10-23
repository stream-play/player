# TECH-INTEGRATION-PIPELINE — Integration Pipeline

## Goal
Connect bounded provider import, transactional sync, category mapping, EPG indexing and provenance. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/schermen/24_24_Playlists_providers.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: ~/Projects/iptv/crates/store/src/live.rs (crates/store/src/live.rs:5 @ 7469f2a): characterize observable integration pipeline behavior; use synthetic fixtures.

## Scope
- In: Connect bounded provider import, transactional sync, category mapping, EPG indexing and provenance. Publish progress and recoverable errors while keeping the old visible dataset until commit.
- Out: No real provider fixtures or UI-owned import logic.

## Behavior (BDD)
- Feature file(s): features/playlist_import.feature
- Scenarios to make pass: DOM-PLAYLIST_IMPORT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: partial error/offline — atomic import failure; boundary data — large feeds and duplicate IDs

## Domain contract
Indicative ImportCoordinator joins ProviderImporter, CatalogRepository, CategoryRepository and GuideMatcher. Preserve source provenance and manual override precedence; commit an entire refresh atomically. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Malformed late item, cancellation, duplicate sync, concurrent editor draft and offline refresh.

## Acceptance gates
Playlist/categories/EPG BDD, fixture-server integration, fmt, clippy, audit, parser fuzz/security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
