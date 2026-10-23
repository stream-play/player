# TECH-POC-GUI — Poc Gui

## Goal
Deliver the poc gui contract for StreamPlay 2.0. Establish testable behavior and reviewable boundaries before dependent jobs use it.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md; resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md
- Design: resources/StreamPlay_2_0_alle_33_designs/00_Overzicht_33_schermen.jpg — use cross-screen shell hierarchy and state treatment; ignore fictional media, unsupported controls and pixel-perfect placement.
- ADRs: none
- Legacy reference: ~/Projects/iptv/crates/desktop/src/app/shell.rs (crates/desktop/src/app/shell.rs:1 @ 7469f2a): characterize observable poc gui behavior; use synthetic fixtures.

## Scope
- In: Build isolated throwaway native GUI probes for titlebar controls, video embedding, accessibility, DPI, keyboard focus and screenshots on two candidate stacks. Record measurements, platform limits and recommendation for ADR-001/012.
- Out: No production app shell or final framework selection; do not commit a production workspace.

## Behavior (BDD)
- Feature file(s): features/playlist_import.feature
- Scenarios to make pass: DOM-PLAYLIST_IMPORT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path, empty data, partial error/offline, unavailable capability, boundary data, keyboard/a11y, restoration/persistence, multispace isolation, concurrency/undo where relevant, migration compatibility.

## Domain contract
Indicative probes: WindowHost, VideoSurface and AccessibilityTree. Inputs are viewport/DPI/theme/focus and a fake video surface; report event and screenshot behavior. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Resize/fullscreen, screenreader traversal, reduced motion, macOS traffic lights, Windows titlebar fallback and video surface handoff.

## Acceptance gates
POC acceptance scenarios, keyboard/a11y checks and comparative screenshots in three themes; fmt/clippy/audit for retained Rust POC code.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Screenshots in Cinematic Dark, Midnight Navy and Studio Light reviewed.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
