# ADR-013 — Future Custom Theme

Status: Proposed

## Context

Define forward-compatible custom theme storage without an editor.

## Options

- **Store future custom fields read-safe::** Read-safe future custom fields avoid later destructive migration but require explicit unknown-value fallback now.
- **Official presets only schema::** Preset-only schema is smaller today but may need a later migration for user themes.

## Evidence

- v1: `crates/desktop/src/theme.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:18` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Investigate store future custom fields read-safe through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

SP-26.

## Spike/POC needed

None before owner decision; feature job must characterize its domain contract with synthetic fixtures.
