# TECH-DOMAIN-CATEGORY — Domain Category

## Goal
Define Category and CategoryMapping identity, normalized provider category references and precedence for Space/manual overrides. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/schermen/31_31_Categorieen_genrebeheer.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: ~/Projects/iptv/README.md (README.md:3 @ 7469f2a): characterize observable domain category behavior; use synthetic fixtures.

## Scope
- In: Define Category and CategoryMapping identity, normalized provider category references and precedence for Space/manual overrides. Specify dry-run, ordering and refresh survival.
- Out: No category editor UI or bulk mutation without validation.

## Behavior (BDD)
- Feature file(s): features/categories.feature
- Scenarios to make pass: DOM-CATEGORIES-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path — satisfy the listed invariant; boundary data — verify IDs and conflicts; partial error/offline — retain valid state

## Domain contract
Indicative CategoryRepository and MappingPreview ports use stable Category and CategoryMapping UUIDs. Preserve raw provider category; precedence is manual Space override, global local mapping, normalized provider value, fallback. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Duplicate provider labels, renamed local category, orphaned source and stale draft.

## Acceptance gates
Categories BDD, precedence property tests, atomic mapping integration, fmt, clippy and audit.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
