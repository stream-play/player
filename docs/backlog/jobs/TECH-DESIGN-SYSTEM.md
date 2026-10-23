# TECH-DESIGN-SYSTEM — Design System

## Goal
Implement three official theme token sets, Asap Sharp loading/fallback, pinned ProIcons registry, accessible primitives, app shell and approved window chrome. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md
- Design: resources/StreamPlay_2_0_alle_33_designs/00_Overzicht_33_schermen.jpg; resources/StreamPlay_2_0_alle_33_designs/26_Appearance.jpg; resources/StreamPlay_2_0_alle_33_designs/21_Spaces_overzicht.jpg; resources/StreamPlay_2_0_alle_33_designs/04_Live_TV_overzicht.jpg — take the three-theme intent, sidebar/topbar hierarchy, active-nav pill, Space switcher and traffic-light placement. Ignore 26’s broken glyph boxes and dark “Studio Light” crop, plus fictional provider/media data in 21 and 04. Theme tokens and chrome behavior come from the style guide and ADRs, not these mockups.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012, ADR-010, ADR-011
- Legacy reference: ~/Projects/iptv/crates/desktop/src/theme.rs (crates/desktop/src/theme.rs:6 @ 7469f2a): characterize observable design system behavior; use synthetic fixtures.

## Scope
- In: Implement three official theme token sets, Asap Sharp loading/fallback, pinned ProIcons registry, accessible primitives, app shell and approved window chrome. Publish stable component and token APIs.
- Out: No custom-theme editor, fabricated media or screen-specific business flows.

## Behavior (BDD)
- Feature file(s): features/appearance.feature
- Scenarios to make pass: DOM-APPEARANCE-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: keyboard/a11y — shell navigation and focus; unavailable capability — missing licensed assets

## Domain contract
Indicative ThemeTokens, IconRegistry, FontRegistry and AppShell contracts take theme, locale, viewport, focus and reduced-motion preference. Only three official presets are selectable; future custom values must fall back safely. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Missing fonts/icons, contrast in Studio Light, DPI scaling, titlebar focus, long localized text and reduced motion.

## Acceptance gates
Component BDD/unit tests, fmt, clippy, audit, three-theme screenshots, WCAG 2.2 AA/keyboard/reduced-motion and asset licence check.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] Screenshots in Cinematic Dark, Midnight Navy and Studio Light reviewed.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
