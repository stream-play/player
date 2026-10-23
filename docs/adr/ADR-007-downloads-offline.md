# ADR-007 — Downloads Offline

Status: Proposed

## Context

Define permitted offline copies and rights enforcement.

## Options

- **Validated provider-permitted downloads:** Validated downloads support offline viewing where provider rights allow; require bounded transfer, safe file publication and revocation handling.
- **No offline copy in first release:** Deferring offline copy avoids rights and storage risks but removes a v1 user workflow.

## Evidence

- v1: `crates/downloads/src/lib.rs:19 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:12` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.

## Recommendation

Prefer **Validated provider-permitted downloads**. It retains the v1 offline workflow only where rights and provider capability can be verified; reject unsupported live or protected streams. This remains a proposal for owner decision.

## Blocked until decided

SP-18.

## Spike/POC needed

`TECH-POC-PLAYER` for codecs, tracks, sessions and rights.
