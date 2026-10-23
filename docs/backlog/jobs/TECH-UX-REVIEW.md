# TECH-UX-REVIEW — Ux Review

## Goal
Review all 33 screens across three themes for task completion, copy, focus, VoiceOver, scaling, RTL and reduced motion. The output closes the named release gate with reviewable evidence.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md; resources/StreamPlay_2_0_Specificaties/guides/SCHERMINDEX.md
- Design: resources/StreamPlay_2_0_alle_33_designs/00_Overzicht_33_schermen.jpg — use cross-screen shell hierarchy and state treatment; ignore fictional media, unsupported controls and pixel-perfect placement.
- ADRs: none
- Legacy reference: ~/Projects/iptv/crates/desktop/src/app/shell.rs (crates/desktop/src/app/shell.rs:4 @ 7469f2a): characterize observable ux review behavior; use synthetic fixtures.

## Scope
- In: Review all 33 screens across three themes for task completion, copy, focus, VoiceOver, scaling, RTL and reduced motion. Record actionable defects mapped to owning screen jobs.
- Out: No unapproved UX redesign or silent ADR changes.

## Behavior (BDD)
- Feature file(s): none — cross-screen review findings
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Indicative screen review inputs are the 33 viewmodels, theme tokens, locale, viewport and accessibility tree. Compare only authorized content states; never infer capability from a mockup. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Empty/offline/error states, long Dutch labels, Studio Light dialogs, narrow windows and keyboard-only traversal.

## Acceptance gates
All screen BDD green; three-theme screenshots per screen, WCAG 2.2 AA and independent UX/UI/security/code review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Screenshots in Cinematic Dark, Midnight Navy and Studio Light reviewed.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
