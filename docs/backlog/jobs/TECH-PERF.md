# TECH-PERF — Perf

## Goal
Benchmark 30k+ channels, 80k+ films, large XMLTV, search, artwork memory and four-stream MultiView with synthetic data. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/factory/INITIATIVES_EN_JOB_BACKLOG.md; resources/StreamPlay_2_0_Specificaties/bdd/BDD_STRATEGIE.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: ~/Projects/iptv/crates/playback/src/lib.rs (crates/playback/src/lib.rs:20 @ 7469f2a): characterize observable perf behavior; use synthetic fixtures.

## Scope
- In: Benchmark 30k+ channels, 80k+ films, large XMLTV, search, artwork memory and four-stream MultiView with synthetic data. Publish budgets and regression thresholds.
- Out: No optimization that changes identity or visible behavior without its owning contract job.

## Behavior (BDD)
- Feature file(s): none — cross-domain benchmark and profiling evidence.
- Scenarios to make pass: none — measured performance acceptance artefact.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: boundary data — benchmark large catalogues; partial error/offline — measure degraded operation.

## Domain contract
Indicative benchmark inputs are synthetic counts, playlist/EPG size, theme, viewport and simultaneous streams. Measure cold start, query latency, memory and frame/stream stability without changing domain identity. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Cold start, long session, decoded texture growth, slow storage and provider connection pressure.

## Acceptance gates
Performance scenarios/benchmarks, profiler evidence, fmt, clippy, audit and security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
