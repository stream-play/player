# TECH-RUST-WORKSPACE — Rust Workspace

## Goal
Deliver the rust workspace contract for StreamPlay 2.0. Establish testable behavior and reviewable boundaries before dependent jobs use it.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md; resources/StreamPlay_2_0_Specificaties/bdd/BDD_STRATEGIE.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: ~/Projects/iptv/Cargo.toml (Cargo.toml:1 @ 7469f2a): characterize observable rust workspace behavior; use synthetic fixtures.

## Scope
- In: Create a minimal Rust workspace with domain, adapter, desktop and test-support boundaries, deterministic synthetic fixtures, formatting/lint/audit gates and CI. Publish module ownership and test commands for later jobs.
- Out: No screen features, provider accounts, playback integration or schema content.

## Behavior (BDD)
- Feature file(s): features/playlist_import.feature
- Scenarios to make pass: DOM-PLAYLIST_IMPORT-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path, empty data, partial error/offline, unavailable capability, boundary data, keyboard/a11y, restoration/persistence, multispace isolation, concurrency/undo where relevant, migration compatibility.

## Domain contract
Indicative crate boundaries: domain invariants, adapter ports, desktop shell and test support. Fixtures must be synthetic, deterministic and isolated from provider credentials. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Offline CI, dependency audit findings, platform build differences and fixture isolation.

## Acceptance gates
Workspace smoke BDD, cargo test, cargo fmt, clippy -D warnings, cargo audit and CI gate.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
