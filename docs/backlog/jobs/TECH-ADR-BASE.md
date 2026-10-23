# TECH-ADR-BASE — Adr Base

## Goal
Collect POC evidence and seek explicit owner decisions for ADR-001/002/003/004/012. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: `~/Projects/iptv` (`crates/desktop/src/app/shell.rs:4 @ 7469f2a`; `crates/playback/src/lib.rs:257 @ 7469f2a`; `crates/store/src/lib.rs:28 @ 7469f2a`; `crates/providers/src/m3u.rs:121 @ 7469f2a`; `crates/desktop/src/app/shell.rs:4 @ 7469f2a`): characterize the observable behavior; use synthetic fixtures.

## Scope
- In: Collect POC evidence and seek explicit owner decisions for ADR-001/002/003/004/012. Record the accepted option, rationale, alternatives, licence implications and affected jobs in each ADR.
- Out: No foundation implementation and no inferred owner approval from v1 handover.

## Behavior (BDD)
- Feature file(s): none — owner decisions recorded in the ADR register
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Decision inputs are POC evidence, licence inventory, migration constraints and owner response. Output ADR statuses and job gate changes; no runtime domain object is introduced. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Conflicting POC results, unresolved platform/licence evidence and unsupported provider format remain blockers.

## Acceptance gates
Decision records have cited evidence and explicit owner approval; foundation jobs remain blocked until all five decisions are recorded.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
