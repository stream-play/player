# ADR-014 — Multi User Cloud

Status: Proposed

## Context

Set the local-only versus account/cloud boundary.

## Options

- **Local-only data and reminders::** Local-only scope keeps privacy and backup behavior tractable but cannot promise cross-device reminders or sync.
- **Account/cloud sync::** Accounts/cloud enable multi-device state but introduce identity, security, conflict and infrastructure commitments.

## Evidence

- v1: `crates/store/src/spaces.rs:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:19` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:242`): “Local Mac programme reminders. **No iPhone/iPad push service yet**; user chose local only. Mac notifications do not automatically sync to other Apple devices.”

## Recommendation

Investigate local-only data and reminders through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

SP-23.

## Spike/POC needed

None before owner decision; feature job must characterize its domain contract with synthetic fixtures.
