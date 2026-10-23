# ADR-010 — Asap Sharp Licence

Status: Proposed

## Context

Verify embedded Asap Sharp files, licence and fallback coverage.

## Options

- **Bundle verified Asap Sharp files::** Bundled verified fonts preserve the intended typography offline but require file inventory, licence and fallback glyph coverage.
- **Licensed fallback family::** A fallback family avoids missing assets but changes line breaks and visual acceptance across all screens.

## Evidence

- v1: `crates/desktop/src/theme.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:15` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:27`): “Use embedded **Asap Sharp** and **Proicons**. The font/icon inventory already exists; do not replace it with emoji, Unicode control glyphs or a runtime CDN.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:38`): “GPL-3.0-or-later and policy Markdown files are already established in the public repo. Do not reopen the licensing discussion.”

## Recommendation

Investigate bundle verified asap sharp files through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

TECH-DESIGN-SYSTEM.

## Spike/POC needed

`TECH-AUDIT-LEGACY` for live evidence, migration and asset/licence inventory.
