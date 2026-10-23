# ADR-005 — Space Scoping

Status: Proposed

## Context

Define which data is global and which belongs to a Space.

## Options

- **Space-scoped personal state:** Space-scoped favorites and overrides meet the proposed invariant but require migration from shared player categories and channel-wide favorites.
- **Shared global state with explicit Space overrides:** Global records with Space overlays ease shared identity but can leak preference changes across Spaces if precedence is unclear.

## Evidence

- v1: `crates/store/src/space_state.rs:5 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:10` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- Scope conflict: spec proposes Space scoped data (`resources/StreamPlay_2_0_Specificaties/guides/DATA_EN_CONTENT_MODELLEN.md:5`); v1 favorites/positions per Space but guide mappings global (`HANDOVER.md:91`); player favorites channel-wide, preferences/pins/order per Space (`HANDOVER.md:115`); shared live categories (`HANDOVER.md:113`).

## Recommendation

Prefer **Space-scoped personal state**. It follows the proposed data invariant and reduces cross-Space preference leakage; shared identities and guide mappings need an explicit precedence model. This remains a proposal for owner decision.

## Blocked until decided

TECH-DOMAIN-SPACE, SP-21, SP-22.

## Spike/POC needed

None before owner decision; feature job must characterize its domain contract with synthetic fixtures.
