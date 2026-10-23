# TECH-DOMAIN-EPG — Domain Epg

## Goal
Define EpgProgram intervals, source provenance, channel mapping confidence and manual override. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md; resources/StreamPlay_2_0_Specificaties/schermen/06_06_Volledige_EPG.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: `~/Projects/iptv` (`crates/providers/src/xmltv.rs:33 @ 7469f2a`): characterize the observable behavior; use synthetic fixtures.

## Scope
- In: Define EpgProgram intervals, source provenance, channel mapping confidence and manual override. Preserve UTC storage and timezone display semantics.
- Out: No guide UI, guessed match acceptance or live feed account use.

## Behavior (BDD)
- Feature file(s): features/epg_mapping.feature
- Scenarios to make pass: DOM-EPG_MAPPING-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path — satisfy the listed invariant; boundary data — verify IDs and conflicts; partial error/offline — retain valid state

## Domain contract
Indicative EpgRepository and GuideMatcher ports use provider/external ID or time range, channel ID and UTC interval. startUtc < endUtc; manual mapping outranks automatic confidence. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Overlapping programs, DST transition, missing guide, malformed XMLTV and stale mapping.

## Acceptance gates
EPG-mapping BDD, interval property tests, parser integration, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
