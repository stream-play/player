# ADR-009 — Releases

Status: Proposed

## Context

Set signing, notarization and platform distribution policy.

## Options

- **Direct signed distribution::** Signed direct distribution improves trust and update identity but requires certificates, notarization and recovery testing.
- **Unsigned preview then signing::** Unsigned previews simplify early delivery but may trigger platform warnings and cannot claim production distribution readiness.

## Evidence

- v1: `README.md:1 @ 7469f2a`. This establishes prior behavior, not v2 approval.
- Staged player: `crates/desktop/src/app.rs:1 @ 869ce22`; scope and maturity need a live audit.
- Specs: `resources/StreamPlay_2_0_Specificaties/guides/BESLISSINGEN_EN_RISICOS.md:14` and `resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md`.
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:25`): “Target **macOS Apple Silicon** and **Windows x64 MSVC**. Linux is deferred.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:37`): “No publisher signing/notarization for initial releases. Local preview bundles have used ad-hoc signing only.”
- **owner decision in v1, needs confirmation for v2** (`HANDOVER.md:38`): “GPL-3.0-or-later and policy Markdown files are already established in the public repo. Do not reopen the licensing discussion.”

## Recommendation

Investigate direct signed distribution through the named POC and owner review. Preserve the alternative until the evidence and licensing/compatibility checks are complete.

## Blocked until decided

TECH-RELEASE.

## Spike/POC needed

`TECH-AUDIT-LEGACY` for live evidence, migration and asset/licence inventory.
