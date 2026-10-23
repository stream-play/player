# ADR-009 — Releases

Status: Proposed

## Context

Set signing, notarization and platform distribution policy.

## Options

- **Direct signed distribution:** Signed direct distribution improves trust and update identity but requires certificates, notarization and recovery testing.
- **Unsigned preview then signing:** Unsigned previews simplify early delivery but may trigger platform warnings and cannot claim production distribution readiness.

## Evidence

- v1: `scripts/build-macos.sh:42-63 @ 7469f2a` selects a redacted signing identity and signs/verifies the bundle; `scripts/build-windows.sh:32-54 @ 7469f2a` builds and stages the Windows executable. These establish prior behavior, not v2 approval.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:14` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:25`): “Target **macOS Apple Silicon** and **Windows x64 MSVC**. Linux is deferred.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:37`): “No publisher signing/notarization for initial releases. Local preview bundles have used ad-hoc signing only.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:38`): “GPL-3.0-or-later and policy Markdown files are already established in the public repo. Do not reopen the licensing discussion.”

## Recommendation

Prefer **Unsigned preview then signing**. It matches the recorded v1 preview practice while keeping signed distribution as a separate release gate; owner confirmation is required. This remains a proposal for owner decision.

## Blocked until decided

TECH-RELEASE.

## Spike/POC needed

None: the listed decision can use the legacy audit and owner-provided evidence; no separate technical POC is required.
