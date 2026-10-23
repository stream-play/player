# Open questions

These items require evidence or owner decisions before the listed work starts. No open item is silently resolved by a recommendation.

## OQ-001 — Reuse of staged player versus from-scratch SP2

- Status: open
- Question: Reuse of staged player versus from-scratch SP2?
- Evidence: `HANDOVER.md:7; resources/StreamPlay_2_0_Specificaties/README.md:3`.
- Options: Adopt only behavior with tests; or revise the SP2 premise.
- Owner-only: yes.
- Blocks: TECH-AUDIT-LEGACY, ADR-001.

## OQ-002 — Snapshot and HANDOVER commit drift

- Status: evidence-supplied
- Question: Snapshot and HANDOVER commit drift?
- Evidence: `HANDOVER.md:15-16`; v1 HEAD `7469f2a60640850fa5fd3c710dad9124594a9365` equals snapshot `7469f2a` (0 commits after, snapshot ancestor exit 0); player HEAD `869ce22b96569fb3c9f5da616fbcd042966b3b6c` equals snapshot `869ce22` (0 commits after, snapshot ancestor exit 0). HANDOVER heads `040b2b5` and `72dc8a5` resolve as ancestors of their snapshots and HEADs. Initial porcelain counts: 6 and 0. Baseline evidence supplied in `LEGACY_AUDIT_LEDGER.md` §1; no baseline selected.
- Options: Audit newer commits; or freeze the two snapshots as baseline.
- Owner-only: yes.
- Blocks: TECH-AUDIT-LEGACY, TECH-ADR-BASE.

## OQ-003 — Platform scope: Windows x64 versus macOS-centric screen and chrome contracts

- Status: open
- Question: Platform scope: Windows x64 versus macOS-centric screen and chrome contracts?
- Evidence: `HANDOVER.md:25; resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md:16`.
- Options: Ship both platforms; or stage Windows after macOS.
- Owner-only: yes.
- Blocks: ADR-001, ADR-009, TECH-RELEASE.

## OQ-004 — Initial signing and notarization

- Status: open
- Question: Initial signing and notarization?
- Evidence: `HANDOVER.md:37; resources/StreamPlay_2_0_Specificaties/factory/INITIATIVES_EN_JOB_BACKLOG.md:48`.
- Options: Unsigned initial build; or signed distribution gate.
- Owner-only: yes.
- Blocks: ADR-009, TECH-RELEASE.

## OQ-005 — Recording controls in visual references

- Status: open
- Question: Recording controls in visual references?
- Evidence: `HANDOVER.md:253; resources/StreamPlay_2_0_alle_33_designs/04_Live_TV_overzicht.jpg`.
- Options: Implement real recording; or remove unsupported action.
- Owner-only: yes.
- Blocks: SP-04, SP-05, ADR-007.

## OQ-006 — Space scope for favorites, guide maps and categories

- Status: open
- Question: Space scope for favorites, guide maps and categories?
- Evidence: `HANDOVER.md:91,113,115; resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md:5`.
- Options: Space scoped; shared global with explicit overrides.
- Owner-only: yes.
- Blocks: ADR-005, TECH-DOMAIN-SPACE, TECH-DOMAIN-CATEGORY.

## OQ-007 — MultiView four-stream cap

- Status: open
- Question: MultiView four-stream cap?
- Evidence: `HANDOVER.md:222; crates/desktop/src/app/multiview.rs:70 @ 7469f2a; resources/StreamPlay_2_0_Specificaties/schermen/19_19_MultiView_dashboard.md`.
- Options: Keep cap 4; or capability-based cap after POC.
- Owner-only: yes.
- Blocks: ADR-008, SP-19-20.

## OQ-008 — UI language and copy source

- Status: open
- Question: UI language and copy source?
- Evidence: `resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md:85; v1 docs/src/pages/audit.md:69 @ 7469f2a`.
- Options: Dutch first; or bilingual release with reviewed strings.
- Owner-only: yes.
- Blocks: TECH-DESIGN-SYSTEM, TECH-UX-REVIEW.

## OQ-009 — Asap Sharp, ProIcons, flags and brand asset files/licences

- Status: evidence-supplied
- Question: Asap Sharp, ProIcons, flags and brand asset files/licences?
- Evidence: `HANDOVER.md:27,82`; v1 tracks Noto Sans plus OFL, while player tracks Asap Sharp Regular (65,476 bytes) and SemiBold (65,552 bytes), an OFL licence and a pinned manifest. APR-0006 directs v2 to re-derive the static instances from upstream and ship OFL.txt. Player HEAD also tracks 26 ProIcons SVGs and an MIT licence; the owner-designated `resources/proicons @ 1c810f0` source tracks 544 SVGs. Both HEADs track 250 flags and a licence. See ledger LA-008–LA-011 and §4(a-c). Only archive-to-pin equivalence remains at OQ-020.
- Options: Provide pinned licensed assets; or approve fallback set.
- Owner-only: yes.
- Blocks: ADR-010, ADR-011, TECH-DESIGN-SYSTEM.

## OQ-010 — GPL for v2 and native codec distribution

- Status: evidence-supplied
- Question: GPL for v2 and native codec distribution?
- Evidence: `HANDOVER.md:38`; both tracked lockfiles exist: v1 has 522 package entries (SHA-256 `451a3fa655f75b965fcb517b2277375563641391cd68d136f52589677f169a8a`) and player has 520 (`d71499c9fecb416dfc882457d716fd6204b87944f88ee0c066e67d429dac0ea1`). Manifest features, release profiles and target-specific dependencies are inventoried in ledger LA-032 and §4(j). The targeted lockfile scan found no named ffmpeg/mpv/gstreamer/webkit/symphonia/libav/rodio packages; the owner still decides v2 native-codec redistribution policy.
- Options: Confirm GPL with bundled native inventory; or choose another distribution plan.
- Owner-only: yes.
- Blocks: ADR-002, ADR-009, TECH-RELEASE.

## OQ-011 — TMDB and subtitle service keys and attribution

- Status: open
- Question: TMDB and subtitle service keys and attribution?
- Evidence: `HANDOVER.md:244,251; resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:10`.
- Options: User supplied opt-in keys; or defer remote integrations.
- Owner-only: yes.
- Blocks: ADR-006, SP-27, SP-28.

## OQ-012 — Design ZIP citation versus unzipped resource directory

- Status: open
- Question: Design ZIP citation versus unzipped resource directory?
- Evidence: `resources/StreamPlay_2_0_Specificaties/README.md:15; resources/StreamPlay_2_0_alle_33_designs/LEESMIJ.txt`.
- Options: Keep folder as canonical paths; or restore documented ZIP.
- Owner-only: yes.
- Blocks: TECH-UX-REVIEW.

## OQ-013 — Untestable visual differences threshold

- Status: open
- Question: Untestable visual differences threshold?
- Evidence: `resources/StreamPlay_2_0_Specificaties/schermen/21_21_Spaces_overzicht.md:96`.
- Options: Set image diff tolerance and masks; or human review criteria.
- Owner-only: no.
- Blocks: TECH-UX-REVIEW, SP-21.

## OQ-014 — Live source assets and fixtures absent from snapshots

- Status: evidence-supplied
- Question: Live source assets and fixtures absent from snapshots?
- Evidence: `crates/desktop/assets/README.md:3-37 @ 7469f2a`; ledger §4(a-h) inventories the tracked fonts, icons, flags, artwork, marks, references and fixtures. The only residual fixture host provenance question is OQ-021. See LA-009–LA-015 and LA-033.
- Options: Read-only live audit; or obtain sanitized fixtures and manifest.
- Owner-only: no.
- Blocks: TECH-AUDIT-LEGACY, TECH-POC-PLAYER.

## OQ-015 — Scripts and lockfiles absent from snapshots

- Status: resolved
- Question: Scripts and lockfiles absent from snapshots?
- Evidence: `HANDOVER.md:82`; ledger §4(i-k) inventories both lockfiles, Cargo manifests, scripts and workflows. See LA-030–LA-032. Downstream redistribution and release policy remain owner questions OQ-004 and OQ-010.
- Options: Read-only live audit; or attach vetted script/lockfile snapshots.
- Owner-only: no.
- Blocks: none; the read-only inventory is in the ledger.

## OQ-016 — Specific provider rights and offline permissions

- Status: open
- Question: Specific provider rights and offline permissions?
- Evidence: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:11`.
- Options: Feature-gate by provider capability; or defer downloads.
- Owner-only: yes.
- Blocks: ADR-007, SP-18.

## OQ-017 — SP-04/SP-05 mockup filenames and screen roles

- Status: open
- Question: Are the SP-04 and SP-05 mockup filenames swapped? SP-04’s file depicts a full player, while SP-05’s file depicts the overview hero, filters and directory. The screen specifications remain authoritative pending confirmation.
- Evidence: `resources/StreamPlay_2_0_alle_33_designs/04_Live_TV_overzicht.jpg`; `resources/StreamPlay_2_0_alle_33_designs/05_Live_TV_player.jpg`; `resources/StreamPlay_2_0_Specificaties/schermen/04_04_Live_TV_overzicht.md:10`; `resources/StreamPlay_2_0_Specificaties/schermen/05_05_Live_TV_player.md:10`. The images also depict unsupported viewer counts, 4K/HDR/Atmos badges and “Kijk vanaf begin”.
- Options: Correct the design filenames; or keep filenames and explicitly document the cross-reference.
- Owner-only: yes.
- Blocks: SP-04, SP-05.

## OQ-018 — Accent swatches on Appearance mockup

- Status: open
- Question: Are the six accent swatches in the SP-26 mockup intended for v2? The spec lists three official themes and a Space override but no accent selection interaction.
- Evidence: `resources/StreamPlay_2_0_alle_33_designs/26_Appearance.jpg`; `resources/StreamPlay_2_0_Specificaties/schermen/26_26_Appearance.md:30-35`; `resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md`. The dark Studio Light crop and broken icon glyphs are mockup defects.
- Options: Defer accents; or add an explicit theme-token and BDD contract after ADR-013 review.
- Owner-only: yes.
- Blocks: SP-26, ADR-013.


## OQ-019 — Asap Sharp v2 derivation and licence

- Status: evidence-supplied
- Question: What reuse path applies to the player Asap Sharp files?
- Evidence: Owner decision APR-0006 authorizes re-deriving static Regular/SemiBold instances from `Omnibus-Type/Asap_Sharp @ 41d013ad7c374fd7fc3f5fc99571b582020d509b` at `fonts/VARIABLE/AsapSharp[wdth,wght].ttf`, with `OFL.txt` shipped. The player manifest pins the upstream source and contains hashes; `crates/desktop/assets/fonts/OFL.txt` states SIL OFL 1.1 with no Reserved Font Name (ledger LA-009).
- Options: Re-derive from the pinned upstream variable font and ship OFL.txt (owner-selected).
- Owner-only: yes
- Blocks: TECH-DESIGN-SYSTEM

## OQ-020 — ProIcons source, licence and embedding

- Status: evidence-supplied
- Question: Does the supplied ProIcons archive correspond to the owner-designated pinned source and include redistribution terms?
- Evidence: Player HEAD tracks 26 Proicons SVGs, LICENSE.txt and manifest metadata; `crates/desktop/src/assets.rs:62-65 @ 869ce22` embeds icons. Owner direction selects `resources/proicons @ 1c810f0`, which tracks 544 SVGs and LICENSE.txt; the authorized archive also contains 544 SVG entries. Exact archive-to-pin content equivalence and licence scope remain unverified. See ledger LA-010.
- Options: Confirm source/archive correspondence and licence; or use the pinned player inventory after owner review.
- Owner-only: yes
- Blocks: ADR-011, TECH-DESIGN-SYSTEM

## OQ-021 — Fixture, script, CI and dependency inventory completion

- Status: open
- Question: What are the complete fixture classifications, workflow/release behaviors and native/codec dependency findings?
- Evidence: `LEGACY_AUDIT_LEDGER.md` §4(h-k); test-tree scans found no non-reserved IPv4 address, and all but one test source were classified synthetic. `crates/providers/tests/network.rs` contains two short non-reserved host literals with unknown provenance (LA-019). Script, CI and dependency inventories are recorded at LA-030–LA-032.
- Options: Complete the read-only inventory and scans; or provide reviewed, sanitized inventory evidence.
- Owner-only: no
- Blocks: TECH-SECURITY
