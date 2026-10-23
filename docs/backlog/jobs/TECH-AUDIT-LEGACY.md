# TECH-AUDIT-LEGACY — Audit Legacy

## Goal
Reconcile the snapshot matrix with the live read-only source, assets, fixtures, scripts and subsequent history. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/README.md; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: ~/Projects/iptv/README.md (README.md:3 @ 7469f2a): characterize observable audit legacy behavior; use synthetic fixtures.

## Scope
- In: Reconcile the snapshot matrix with the live read-only source, assets, fixtures, scripts and subsequent history. Record each changed capability, evidence line and reuse verdict; do not import user content.
- Out: No application implementation, schema edits, provider account tests or source-tree changes.

## Behavior (BDD)
- Feature file(s): none — audit evidence and updated capability matrix
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Evidence ledger inputs are snapshot commit, original path/line, live path/line and observed behavior. Output one verdict per capability; no runtime port is implemented. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Inventory may be incomplete or commits may differ; mark absence as unknown, not unsupported. Redact all real endpoints and identities.

## Acceptance gates
Evidence citation audit, matrix/OPEN_QUESTIONS diff and security leak scan; no cargo build is required for this documentation job.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
