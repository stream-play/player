# ADR-011 — Proicons

Status: Proposed

## Context

Verify the complete ProIcons inventory, licence and semantic mapping.

## Options

- **Pin supplied licensed ProIcons::** Pinning supplied icons preserves intended semantics and offline availability but requires inventory and licence proof.
- **Use a separately approved icon set::** A replacement set may be legally simpler yet changes every icon mapping and screenshot baseline.

## Evidence

- v1: `crates/desktop/src/app/shell.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:16` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:27`): “Use embedded **Asap Sharp** and **Proicons**. The font/icon inventory already exists; do not replace it with emoji, Unicode control glyphs or a runtime CDN.”

## Recommendation

Investigate pin supplied licensed proicons through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

TECH-DESIGN-SYSTEM.

## Spike/POC needed

`TECH-AUDIT-LEGACY` for live evidence, migration and asset/licence inventory.
