# TECH-PERF — Perf

## Goal
Deliver the perf contract for StreamPlay 2.0. Establish testable behavior and reviewable boundaries before dependent jobs use it.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/factory/INITIATIVES_EN_JOB_BACKLOG.md; resources/StreamPlay_2_0_Specificaties/bdd/BDD_STRATEGIE.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: ~/Projects/iptv/crates/playback/src/lib.rs (crates/playback/src/lib.rs:1 @ 7469f2a): characterize observable perf behavior; use synthetic fixtures.

## Scope
- In: Benchmark 30k+ channels, 80k+ films, large XMLTV, search, artwork memory and four-stream MultiView with synthetic data. Publish budgets and regression thresholds.
- Out: No optimization that changes identity or visible behavior without its owning contract job.

## Behavior (BDD)
- Feature file(s): features/live_player.feature
- Scenarios to make pass: DOM-LIVE_PLAYER-INV-01
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: happy path, empty data, partial error/offline, unavailable capability, boundary data, keyboard/a11y, restoration/persistence, multispace isolation, concurrency/undo where relevant, migration compatibility.

## Domain contract
Indicative benchmark inputs are synthetic counts, playlist/EPG size, theme, viewport and simultaneous streams. Measure cold start, query latency, memory and frame/stream stability without changing domain identity. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Cold start, long session, decoded texture growth, slow storage and provider connection pressure.

## Acceptance gates
Performance scenarios/benchmarks, profiler evidence, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Named and additional scenarios pass with synthetic fixtures.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
