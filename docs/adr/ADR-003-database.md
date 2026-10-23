# ADR-003 — Database

Status: Proposed

## Context

Choose persistent storage and migration strategy.

## Options

- **SQLite with versioned migrations::** SQLite supports transactional imports, versioned migrations and offline queries; backup/rollback and credential separation become mandatory.
- **Another local storage model::** Another store changes query and migration tooling and would require equivalent atomicity and recovery evidence.

## Evidence

- v1: `crates/store/src/lib.rs:28 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:8` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Investigate sqlite with versioned migrations through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

TECH-RUST-WORKSPACE, TECH-DESIGN-SYSTEM and all other Milestone 1 foundation jobs. `TECH-ADR-BASE` is the deciding job. ADR-001, ADR-002, ADR-003, ADR-004 and ADR-012 together block all Milestone 1 foundation work.

## Spike/POC needed

`TECH-AUDIT-LEGACY` for live evidence, migration and asset/licence inventory.
