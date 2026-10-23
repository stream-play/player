# TECH-MIGRATION — Migration

## Goal
Read legacy storage without mutation, map supported personal state into the approved v2 schema and produce dry-run report, backup and rollback. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md; resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md
- Design: none — no UI reference required.
- ADRs: ADR-003
- Legacy reference: ~/Projects/iptv/crates/store/src/lib.rs (crates/store/src/lib.rs:28 @ 7469f2a): characterize observable migration behavior; use synthetic fixtures.

## Scope
- In: Read legacy storage without mutation, map supported personal state into the approved v2 schema and produce dry-run report, backup and rollback. Preserve ambiguous records for owner review.
- Out: No silent deletion, secret export, or writing to the legacy repository.

## Behavior (BDD)
- Feature file(s): none — migration fixtures and rollback evidence; no migration feature exists yet
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Indicative LegacyReader is read-only; MigrationWriter targets the approved schema. Dry-run maps stable IDs and reports ambiguous favorites/progress; backup and rollback precede writes. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Partial migration, incompatible schema, duplicate source, missing assets and rollback after interruption.

## Acceptance gates
Migration compatibility BDD, synthetic legacy fixture integration, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
