# ADR-012 — Window Chrome

Status: Proposed

## Context

Define native window controls, titlebar appearance and video interaction.

## Options

- **Native traffic lights and themed chrome:** Native traffic lights with themed chrome match macOS designs but require hit-test, fullscreen and accessibility probes.
- **Framework default chrome:** Framework chrome reduces custom platform code but may diverge from the specified integrated shell.

## Evidence

- v1: `crates/desktop/src/app/shell.rs:4 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:20 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:17` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Prefer **Native traffic lights and themed chrome**. It matches the macOS shell brief; TECH-POC-GUI must establish hit-testing, keyboard behavior and Windows fallback. This remains a proposal for owner decision.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

`TECH-POC-GUI` for titlebar, a11y and embedding; `TECH-POC-PLAYER` for playback integration.
