# ADR-010 — Asap Sharp Licence

Status: Proposed

## Context

Verify embedded Asap Sharp files, licence and fallback coverage.

## Options

- **Bundle verified Asap Sharp files:** Bundled verified fonts preserve the intended typography offline but require file inventory, licence and fallback glyph coverage.
- **Licensed fallback family:** A fallback family avoids missing assets but changes line breaks and visual acceptance across all screens.

## Evidence

- v1 font embedding: `crates/desktop/src/theme.rs:165-170 @ 7469f2a` embeds Noto Sans. Player assets: `crates/desktop/assets/manifest.json:2-9 @ 869ce22` and `crates/desktop/assets/manifest.json:275-277 @ 869ce22` pin the Asap Sharp source and hashes; `crates/desktop/assets/fonts/OFL.txt @ 869ce22` states SIL OFL 1.1 with no Reserved Font Name (LA-008, LA-009). APR-0006 directs v2 to re-derive static instances from the upstream variable font and ship `OFL.txt`.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:15` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:27`): “Use embedded **Asap Sharp** and **Proicons**. The font/icon inventory already exists; do not replace it with emoji, Unicode control glyphs or a runtime CDN.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:38`): “GPL-3.0-or-later and policy Markdown files are already established in the public repo. Do not reopen the licensing discussion.”

## Recommendation

Prefer **Bundle verified Asap Sharp files**. It preserves specified typography when asset provenance and redistribution rights are proven; use a licensed fallback only if that evidence fails. This remains a proposal for owner decision.

## Blocked until decided

TECH-DESIGN-SYSTEM.

## Spike/POC needed

None: the listed decision can use the legacy audit and owner-provided evidence; no separate technical POC is required.
