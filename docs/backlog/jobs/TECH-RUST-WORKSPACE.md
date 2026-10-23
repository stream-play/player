# TECH-RUST-WORKSPACE — Rust Workspace

## Goal
Create a minimal Rust workspace with domain, adapter, desktop and test-support boundaries, deterministic synthetic fixtures, formatting/lint/audit gates and CI. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/BUILD_EN_STYLE_GUIDE.md; resources/StreamPlay_2_0_Specificaties/bdd/BDD_STRATEGIE.md
- Design: none — no UI reference required.
- ADRs: ADR-001, ADR-002, ADR-003, ADR-004, ADR-012
- Legacy reference: ~/Projects/iptv/Cargo.toml (Cargo.toml:2 @ 7469f2a): characterize observable rust workspace behavior; use synthetic fixtures.

## Scope
- In: Create a minimal Rust workspace with domain, adapter, desktop and test-support boundaries, deterministic synthetic fixtures, formatting/lint/audit gates and CI. Publish module ownership and test commands for later jobs.
- Out: No screen features, provider accounts, playback integration or schema content.

## Behavior (BDD)
- Feature file(s): none — workspace build and tooling evidence
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Indicative crate boundaries: domain invariants, adapter ports, desktop shell and test support. Fixtures must be synthetic, deterministic and isolated from provider credentials. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Offline CI, dependency audit findings, platform build differences and fixture isolation.

## Acceptance gates
Workspace smoke BDD, cargo test, cargo fmt, clippy -D warnings, cargo audit and CI gate.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
