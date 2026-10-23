# ADR-003 — Database

Status: Proposed

## Context

Choose persistent storage and migration strategy.

## Options

- **SQLite with versioned migrations:** SQLite supports transactional imports, versioned migrations and offline queries; backup/rollback and credential separation become mandatory.
- **Another local storage model:** Another store changes query and migration tooling and would require equivalent atomicity and recovery evidence.

## Evidence

- v1: `crates/store/src/lib.rs:28 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:8` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Prefer **SQLite with versioned migrations**. The v1 store already demonstrates local transactional storage; define rollback and credential separation before foundation work. This remains a proposal for owner decision.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

None: the listed decision can use the legacy audit and owner-provided evidence; no separate technical POC is required.
