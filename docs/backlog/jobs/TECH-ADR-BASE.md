# TECH-ADR-BASE — Adr Base

## Goal
Deliver the adr base contract for StreamPlay 2.0. Establish testable behavior and reviewable boundaries before dependent jobs use it.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: ~/Projects/iptv/README.md (README.md:1 @ 7469f2a): characterize observable adr base behavior; use synthetic fixtures.

## Scope
- In: Collect POC evidence and seek explicit owner decisions for ADR-001/002/003/004/012. Record the accepted option, rationale, alternatives, licence implications and affected jobs in each ADR.
- Out: No foundation implementation and no inferred owner approval from v1 handover.

## Behavior (BDD)
- Feature file(s): features/playlist_import.feature
- Scenarios to make pass: DOM-PLAYLIST_IMPORT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path, empty data, partial error/offline, unavailable capability, boundary data, keyboard/a11y, restoration/persistence, multispace isolation, concurrency/undo where relevant, migration compatibility.

## Domain contract
Decision inputs are POC evidence, licence inventory, migration constraints and owner response. Output ADR statuses and job gate changes; no runtime domain object is introduced. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Conflicting POC results, unresolved platform/licence evidence and unsupported provider format remain blockers.

## Acceptance gates
Decision records have cited evidence and explicit owner approval; foundation jobs remain blocked until all five decisions are recorded.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
