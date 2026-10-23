# Open questions

These items require evidence or owner decisions before the listed work starts. No open item is silently resolved by a recommendation.

## OQ-001 — Reuse of staged player versus from-scratch SP2

- Question: Reuse of staged player versus from-scratch SP2?
- Evidence: `HANDOVER.md:7; resources/StreamPlay_2_0_Specificaties/README.md:3`.
- Options: Adopt only behavior with tests; or revise the SP2 premise.
- Owner-only: yes.
- Blocks: TECH-AUDIT-LEGACY, ADR-001.

## OQ-002 — Snapshot and HANDOVER commit drift

- Question: Snapshot and HANDOVER commit drift?
- Evidence: `HANDOVER.md:15-16; player snapshot 869ce22; v1 snapshot 7469f2a`.
- Options: Audit newer commits; or freeze the two snapshots as baseline.
- Owner-only: yes.
- Blocks: TECH-AUDIT-LEGACY, TECH-ADR-BASE.

## OQ-003 — Platform scope: Windows x64 versus macOS-centric screen and chrome contracts

- Question: Platform scope: Windows x64 versus macOS-centric screen and chrome contracts?
- Evidence: `HANDOVER.md:25; resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md:16`.
- Options: Ship both platforms; or stage Windows after macOS.
- Owner-only: yes.
- Blocks: ADR-001, ADR-009, TECH-RELEASE.

## OQ-004 — Initial signing and notarization

- Question: Initial signing and notarization?
- Evidence: `HANDOVER.md:37; resources/StreamPlay_2_0_Specificaties/factory/INITIATIVES_EN_JOB_BACKLOG.md:48`.
- Options: Unsigned initial build; or signed distribution gate.
- Owner-only: yes.
- Blocks: ADR-009, TECH-RELEASE.

## OQ-005 — Recording controls in visual references

- Question: Recording controls in visual references?
- Evidence: `HANDOVER.md:253; resources/StreamPlay_2_0_alle_33_designs/04_Live_TV_overzicht.jpg`.
- Options: Implement real recording; or remove unsupported action.
- Owner-only: yes.
- Blocks: SP-04, SP-05, ADR-007.

## OQ-006 — Space scope for favorites, guide maps and categories

- Question: Space scope for favorites, guide maps and categories?
- Evidence: `HANDOVER.md:91,113,115; resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md:5`.
- Options: Space scoped; shared global with explicit overrides.
- Owner-only: yes.
- Blocks: ADR-005, TECH-DOMAIN-SPACE, TECH-DOMAIN-CATEGORY.

## OQ-007 — MultiView four-stream cap

- Question: MultiView four-stream cap?
- Evidence: `HANDOVER.md:222; crates/desktop/src/app/multiview.rs:8 @ 7469f2a; resources/StreamPlay_2_0_Specificaties/schermen/19_19_MultiView_dashboard.md`.
- Options: Keep cap 4; or capability-based cap after POC.
- Owner-only: yes.
- Blocks: ADR-008, SP-19-20.

## OQ-008 — UI language and copy source

- Question: UI language and copy source?
- Evidence: `resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md:85; v1 docs/src/pages/audit.md:69 @ 7469f2a`.
- Options: Dutch first; or bilingual release with reviewed strings.
- Owner-only: yes.
- Blocks: TECH-DESIGN-SYSTEM, TECH-UX-REVIEW.

## OQ-009 — Asap Sharp, ProIcons, flags and brand asset files/licences

- Question: Asap Sharp, ProIcons, flags and brand asset files/licences?
- Evidence: `HANDOVER.md:27,82; crates/desktop/assets/README.md:24 @ 7469f2a`.
- Options: Provide pinned licensed assets; or approve fallback set.
- Owner-only: yes.
- Blocks: ADR-010, ADR-011, TECH-DESIGN-SYSTEM.

## OQ-010 — GPL for v2 and native codec distribution

- Question: GPL for v2 and native codec distribution?
- Evidence: `HANDOVER.md:38; README.md:23 @ 7469f2a`.
- Options: Confirm GPL with bundled native inventory; or choose another distribution plan.
- Owner-only: yes.
- Blocks: ADR-002, ADR-009, TECH-RELEASE.

## OQ-011 — TMDB and subtitle service keys and attribution

- Question: TMDB and subtitle service keys and attribution?
- Evidence: `HANDOVER.md:244,251; resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:10`.
- Options: User supplied opt-in keys; or defer remote integrations.
- Owner-only: yes.
- Blocks: ADR-006, SP-27, SP-28.

## OQ-012 — Design ZIP citation versus unzipped resource directory

- Question: Design ZIP citation versus unzipped resource directory?
- Evidence: `resources/StreamPlay_2_0_Specificaties/README.md:15; resources/StreamPlay_2_0_alle_33_designs/LEESMIJ.txt`.
- Options: Keep folder as canonical paths; or restore documented ZIP.
- Owner-only: yes.
- Blocks: TECH-UX-REVIEW.

## OQ-013 — Untestable visual differences threshold

- Question: Untestable visual differences threshold?
- Evidence: `resources/StreamPlay_2_0_Specificaties/schermen/21_21_Spaces_overzicht.md:96`.
- Options: Set image diff tolerance and masks; or human review criteria.
- Owner-only: no.
- Blocks: TECH-UX-REVIEW, SP-21.

## OQ-014 — Live source assets and fixtures absent from snapshots

- Question: Live source assets and fixtures absent from snapshots?
- Evidence: `crates/desktop/assets/README.md:1 @ 7469f2a; HANDOVER.md:82`.
- Options: Read-only live audit; or obtain sanitized fixtures and manifest.
- Owner-only: no.
- Blocks: TECH-AUDIT-LEGACY, TECH-POC-PLAYER.

## OQ-015 — Scripts and lockfiles absent from snapshots

- Question: Scripts and lockfiles absent from snapshots?
- Evidence: `HANDOVER.md:82; resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md:77`.
- Options: Read-only live audit; or attach vetted script/lockfile snapshots.
- Owner-only: no.
- Blocks: TECH-AUDIT-LEGACY, TECH-SECURITY.

## OQ-016 — Specific provider rights and offline permissions

- Question: Specific provider rights and offline permissions?
- Evidence: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:11`.
- Options: Feature-gate by provider capability; or defer downloads.
- Owner-only: yes.
- Blocks: ADR-007, SP-18.
