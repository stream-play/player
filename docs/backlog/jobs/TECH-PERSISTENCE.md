# TECH-PERSISTENCE — Persistence

## Goal
Own versioned schema and migration sequence for Spaces, catalogue, categories, playlists and EPG. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: ~/Projects/iptv/crates/store/src/lib.rs (crates/store/src/lib.rs:28 @ 7469f2a): characterize observable persistence behavior; use synthetic fixtures.

## Scope
- In: Own versioned schema and migration sequence for Spaces, catalogue, categories, playlists and EPG. Implement transactions, rollback, backup and secret references only.
- Out: No competing schema migration from a screen job and no live user-data import.

## Behavior (BDD)
- Feature file(s): features/space_management.feature
- Scenarios to make pass: DOM-SPACE_MANAGEMENT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: restoration/persistence — durable Space state; concurrency/undo — transaction rollback

## Domain contract
Indicative repositories persist Space, Playlist, CatalogItem, Category, Favorite and EpgProgram with schema version and transactions. Imports are atomic; secrets are references; backup precedes destructive migration. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Interrupted migration, downgrade, duplicate identity, foreign-key failure and restoration from backup.

## Acceptance gates
Domain BDD, migration integration/property tests, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
