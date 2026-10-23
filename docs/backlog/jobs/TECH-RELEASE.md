# TECH-RELEASE — Release

## Goal
Package approved target-platform builds with versioned native-library inventory, migration backup/rollback, clean-machine install and update path. The output closes the named release gate with reviewable evidence.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/factory/INITIATIVES_EN_JOB_BACKLOG.md; resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md
- Design: none — no UI reference required.
- ADRs: ADR-009
- Legacy reference: ~/Projects/iptv/README.md (README.md:3 @ 7469f2a): characterize observable release behavior; use synthetic fixtures.

## Scope
- In: Package approved target-platform builds with versioned native-library inventory, migration backup/rollback, clean-machine install and update path. Apply owner-approved signing/notarization policy from ADR-009.
- Out: No unsigned public distribution contrary to ADR-009, real account fixture or unapproved licence change.

## Behavior (BDD)
- Feature file(s): none — release artefacts and packaging evidence
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Indicative release inputs are target architecture, approved ADR-009 mode, dependency/native-library inventory and schema version. Output installer, update path and backup/rollback evidence without bundling secrets. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Fresh install, update from old schema, rollback, denied permissions, missing codec and platform-specific packaging failure.

## Acceptance gates
Release smoke BDD, clean-machine integration, fmt, clippy, cargo audit, licence/security review and owner release signoff.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required. Signing and platform targets need owner approval.
