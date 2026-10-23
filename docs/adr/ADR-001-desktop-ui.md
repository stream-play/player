# ADR-001 — Desktop Ui

Status: Proposed

## Context

Choose the v2 desktop UI stack and platform support before app-shell work.

## Options

- **Native Rust UI:** Native Rust UI keeps one native widget/event model and can embed a native player; requires platform a11y, DPI and titlebar work.
- **Rust-hosted web UI:** A web surface can accelerate layout but adds bridge, video embedding and keyboard/a11y failure modes, and conflicts with the v1 owner preference pending v2 confirmation.

## Evidence

- v1: `crates/desktop/src/app/shell.rs:4 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:20 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:6` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:24`): “**Native Rust for both core and UI.** Do not replace the interface with Tauri/web UI.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:25`): “Target **macOS Apple Silicon** and **Windows x64 MSVC**. Linux is deferred.”

## Recommendation

Prefer **Native Rust UI**. It aligns with the specified native shell and the prior owner choice; verify accessibility, DPI and video embedding in TECH-POC-GUI before acceptance. This remains a proposal for owner decision.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

`TECH-POC-GUI` for titlebar, a11y and embedding; `TECH-POC-PLAYER` for playback integration.
