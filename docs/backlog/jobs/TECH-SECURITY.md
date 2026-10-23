# TECH-SECURITY — Security

## Goal
Fuzz playlist/XMLTV parsers and review vault references, downloads, file publication, metadata requests and redaction. The output establishes an independently reviewable contract for downstream jobs.

## Inputs
- Specs: resources/StreamPlay_2_0_Specificaties/guides/TECHNISCHE_ARCHITECTUUR.md; resources/StreamPlay_2_0_Specificaties/bdd/BDD_STRATEGIE.md
- Design: none — no UI reference required.
- ADRs: none
- Legacy reference: ~/Projects/iptv/crates/providers/src/m3u.rs (crates/providers/src/m3u.rs:121 @ 7469f2a): characterize observable security behavior; use synthetic fixtures.

## Scope
- In: Fuzz playlist/XMLTV parsers and review vault references, downloads, file publication, metadata requests and redaction. Maintain native-library and asset licence inventory.
- Out: No production credentials or network tests against real providers.

## Behavior (BDD)
- Feature file(s): none — threat model and security findings
- Scenarios to make pass: none — evidence/acceptance artefact for this job.
- Additional scenarios (from the 10 categories in BDD_STRATEGIE.md) that this job must add: none — evidence job; verify the named artefact and its acceptance gates

## Domain contract
Indicative surfaces are ParserPort, VaultPort, DownloadPublisher and MetadataClient. Bound all untrusted payloads, redact audit events and keep reusable secrets out of catalogue exports. Names are indicative. Apply DATA_EN_CONTENT_MODELLEN.md invariants for stable IDs, provenance, Space isolation and versioned conflicts where relevant.

## States & edge cases
Oversized payload, XML expansion, path traversal, symlink race, cancelled transfer and secret backup leakage.

## Acceptance gates
Fuzz/property tests, security integration tests, fmt, clippy -D warnings, cargo audit and independent security review.

## Definition of done
- [ ] Red test evidence captured before implementation.
- [ ] Evidence artefact and applicable acceptance checks pass with synthetic fixtures.
- [ ] Three-theme screenshots are not applicable because this job delivers no UI.
- [ ] No P0/P1 review issue remains.
- [ ] Related docs, traceability and ADR evidence are updated.

## Escalate to the owner when
A new or changed ADR is required; a destructive data change or migration is proposed; scope expands beyond this job; a paid external service or licence choice is required.
