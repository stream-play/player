# ADR-011 — Proicons

Status: Proposed

## Context

Verify the complete ProIcons inventory, licence and semantic mapping.

## Options

- **Pin supplied licensed ProIcons:** Pinning supplied icons preserves intended semantics and offline availability but requires inventory and licence proof.
- **Use a separately approved icon set:** A replacement set may be legally simpler yet changes every icon mapping and screenshot baseline.

## Evidence

- v1: `crates/desktop/src/app/shell.rs:4 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:16` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:27`): “Use embedded **Asap Sharp** and **Proicons**. The font/icon inventory already exists; do not replace it with emoji, Unicode control glyphs or a runtime CDN.”

## Recommendation

Prefer **Pin supplied licensed ProIcons**. It preserves the specified icon language after inventory and licence verification; a separate set requires renewed visual review. This remains a proposal for owner decision.

## Blocked until decided

TECH-DESIGN-SYSTEM.

## Spike/POC needed

None: the listed decision can use the legacy audit and owner-provided evidence; no separate technical POC is required.
