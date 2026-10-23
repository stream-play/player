# ADR-register, aannames en risico's

| ADR | Onderwerp | Opties / gevolgen | Status |
|---|---|---|---|
| ADR-001 | Desktop UI | Rust-native GUI vs Rust-host + web UI; impact op player, a11y en vensterchrome | OPEN — owner approval |
| ADR-002 | Video backend | libmpv/GStreamer/AVFoundation of legacy-aanpak; codecs/licenties en macOS | OPEN — technical spike |
| ADR-003 | Database | SQLite + migraties vs ander lokaal storage-model | OPEN |
| ADR-004 | Provider formats | M3U, Xtream, EPG feeds; valideer legacy en licenties | OPEN |
| ADR-005 | Space-scoping | global vs Space favorieten, playlists, layout en thema | VOORSTEL: Space scoped |
| ADR-006 | Remote metadata | TMDB credentials, limits, copyright, attribution | OPEN |
| ADR-007 | Downloads/offline | Toegestane soorten en beveiliging per provider | OPEN |
| ADR-008 | MultiView concurrentie | Max streams, audiofocus, GPU limieten | OPEN |
| ADR-009 | Releases | Direct distribution, signing, notarizing, updates | OPEN |
| ADR-010 | Asap Sharp licentie | Verifieer fontfiles, bundling en fallback scripts | OPEN |
| ADR-011 | ProIcons | Semantische icon mapping, MIT bewijs en version pinning | OPEN |
| ADR-012 | Window chrome | Native traffic lights + thematische achtergrond | VOORSTEL — POC nodig |
| ADR-013 | Future Custom Theme | Storage schema voorbereid; geen custom editor in v1 | VOORSTEL |
| ADR-014 | Multi-user/cloud | Lokale app als baseline; geen accountfeatures zonder besluit | OPEN |

## Grootste risico's
1. **UI/Player integratie:** verlies van playerstate tijdens navigatie. Mitigatie: onafhankelijke player-core, E2E navigatiescenario's.
2. **IPTV-data variatie:** onbetrouwbare playlists en verkeerd gekoppelde EPG. Mitigatie: fixtures, confidence-score, manual overrides.
3. **Rechten/distributie:** streams, trailers, metadata, assets, fonts en codecs kunnen beperkingen hebben. Mitigatie: legal/licentie gate.
4. **Database-migratie:** legacy instellingen en favorieten verloren. Mitigatie: reversible migration, read-only legacy en backup.
5. **AI-autonomie:** agents vullen onzekerheid als feit in. Mitigatie: contract-based tickets, eigenaar approval bij ADR changes, evidence in reviews.
6. **Visuele inconsistentie:** screens gebouwd door verschillende agents. Mitigatie: shared tokens/components en screenshots over alle 3 thema's.
7. **Gemengde talen in UI:** gegenereerde screenshots kennen fouten. Mitigatie: i18n-bronbestanden + copyreview in productieschermen.

## Approval gate
Geen foundation implementeren voordat ADR-001, 002, 003, 004 en 012 onderzocht en door eigenaar goedgekeurd zijn. Andere ADR's kunnen feature-gated blijven totdat relevante job begint.
