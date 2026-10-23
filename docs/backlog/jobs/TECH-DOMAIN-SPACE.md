# TECH-DOMAIN-SPACE — Domain Space

## Goal
Define stable Space IDs and scoped preferences, favorites and content selection after ADR-005. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/schermen/21_21_Spaces_overzicht.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012, ADR-005
- Legacy reference: `~/Projects/iptv` (`crates/store/src/spaces.rs:12 @ 7469f2a`; `crates/store/src/space_state.rs:5 @ 7469f2a`): characterize the observable behavior; use synthetic fixtures.

## Scope
- In: Define stable Space IDs and scoped preferences, favorites and content selection after ADR-005. Provide fake ports, isolation tests and conflict behavior for switch, create, archive and restore.
- Out: No Space UI, cloud accounts or destructive deletion without a migration decision.

## Behavior (BDD)
- Feature file(s): features/space_management.feature
- Scenarios to make pass: DOM-SPACE_MANAGEMENT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path — satisfy the listed invariant; boundary data — verify IDs and conflicts; partial error/offline — retain valid state

## Domain contract
Indicative SpaceRepository and SpacePreferences ports use stable Space UUIDs. Favorite key is (spaceId, itemId); Space owns content choice and category overrides; switching Space cannot leak personal state. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Duplicate IDs, last active Space removal, concurrent edits and refresh preserving personal state.

## Acceptance gates
Space-management BDD, property tests for isolation, adapter integration, fmt, clippy and audit.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
