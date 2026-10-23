# TECH-DOMAIN-CATALOG — Domain Catalog

## Goal
Define canonical CatalogItem, SourceItem and ContentSource identities with conservative matching and provenance. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: `~/Projects/iptv` (`crates/store/src/lib.rs:30 @ 7469f2a`; player `crates/store/tests/catalogue.rs:5 @ 869ce22`): characterize the observable behavior; use synthetic fixtures.

## Scope
- In: Define canonical CatalogItem, SourceItem and ContentSource identities with conservative matching and provenance. Expose source selection and merge/separate contracts without remote metadata assumptions.
- Out: No TMDB matching, UI, or automatic merge of uncertain editions.

## Behavior (BDD)
- Feature file(s): features/movie_details.feature
- Scenarios to make pass: DOM-MOVIE_DETAILS-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path — satisfy the listed invariant; boundary data — verify IDs and conflicts; partial error/offline — retain valid state

## Domain contract
Indicative CatalogRepository and SourceResolver ports separate CatalogItem UUID from SourceItem (playlistId, providerItemId). A ContentSource links 0..n playable sources to a canonical title; title/poster is not identity. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Same title different year, remakes, disappearing source and multiple providers per title.

## Acceptance gates
Movie-details BDD, identity property tests, fake-port integration, fmt, clippy and audit.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
