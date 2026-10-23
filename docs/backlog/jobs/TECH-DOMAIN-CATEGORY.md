# TECH-DOMAIN-CATEGORY — Domain Category

## Goal
Deliver the domain category contract for StreamPlay 2.0. Establish testable behavior and reviewable boundaries before dependent jobs use it.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/schermen/31_31_Categorieen_genrebeheer.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: ~/Projects/iptv/README.md (README.md:1 @ 7469f2a): characterize observable domain category behavior; use synthetic fixtures.

## Scope
- In: Define Category and CategoryMapping identity, normalized provider category references and precedence for Space/manual overrides. Specify dry-run, ordering and refresh survival.
- Out: No category editor UI or bulk mutation without validation.

## Behavior (BDD)
- Feature file(s): features/categories.feature
- Scenarios to make pass: DOM-CATEGORIES-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path, empty data, partial error/offline, unavailable capability, boundary data, keyboard/a11y, restoration/persistence, multispace isolation, concurrency/undo where relevant, migration compatibility.

## Domain contract
Indicative CategoryRepository and MappingPreview ports use stable Category and CategoryMapping UUIDs. Preserve raw provider category; precedence is manual Space override, global local mapping, normalized provider value, fallback. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Duplicate provider labels, renamed local category, orphaned source and stale draft.

## Acceptance gates
Categories BDD, precedence property tests, atomic mapping integration, fmt, clippy and audit.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
