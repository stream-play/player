# ADR-014 — Multi User Cloud

Status: Proposed

## Context

Set the local-only versus account/cloud boundary.

## Options

- **Local-only data and reminders:** Local-only scope keeps privacy and backup behavior tractable but cannot promise cross-device reminders or sync.
- **Account/cloud sync:** Accounts/cloud enable multi-device state but introduce identity, security, conflict and infrastructure commitments.

## Evidence

- v1: `crates/store/src/spaces.rs:12 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:19` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:242`): “Local Mac programme reminders. **No iPhone/iPad push service yet**; user chose local only. Mac notifications do not automatically sync to other Apple devices.”

## Recommendation

Prefer **Local-only data and reminders**. It matches the prior local reminder decision and avoids unscoped identity and sync work; the v2 owner must confirm this boundary. This remains a proposal for owner decision.

## Blocked until decided

SP-23.

## Spike/POC needed

None before owner decision; feature job must characterize its domain contract with synthetic fixtures.
