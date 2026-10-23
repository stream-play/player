# ADR-008 — Multiview Concurrency

Status: Proposed

## Context

Set the simultaneous stream, audio and GPU policy.

## Options

- **Fixed four streams::** A fixed four-stream cap matches v1 limits and keeps review predictable; hardware/provider-specific limits may be lower.
- **Capability-based limit::** Capability-based caps can use more capable devices but need reliable provider concurrency accounting and GPU budgets.

## Evidence

- v1: `crates/desktop/src/app/multiview.rs:8 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:13` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:222`): “| #13 | Provider-aware MultiView, maximum four streams |”

## Recommendation

Investigate fixed four streams through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

SP-19-20.

## Spike/POC needed

`TECH-POC-PLAYER` for codecs, tracks, sessions and rights.
