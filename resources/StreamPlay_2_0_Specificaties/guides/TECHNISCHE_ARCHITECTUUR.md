# StreamPlay 2.0 — Technische architectuur (levend document)

**Doel:** technische basis voor volledige Rust-rewrite, uitbreidbaar na repo-audit. **Alle niet gevalideerde keuzes zijn voorstellen.** Update ADR's voordat de Software Factory code genereert.

## 1. Harde uitgangspunten
- Nieuwe git-repository / schone workspace; de bestaande Rust-app wordt alleen referentie-implementatie. Nieuwe code mag gedrag overnemen na expliciete BDD-characterization tests, geen grootschalige copy/paste.
- Rust als hoofdtaal voor domein, applicatielogica en waar mogelijk GUI en spelerintegratie.
- BDD als specificatie, test-first ontwikkelcyclus, traceerbaarheid requirement→scenario→commit→PR.
- macOS desktop primair; architectuur bereidt andere desktops voor zonder ongevalideerd cross-platform-belofte.
- Geen concreet GUI-framework, database of playback engine verplicht totdat proof-of-concepts vergeleken zijn.

## 2. Aanbevolen lagen
```text
streamplay/
  Cargo.toml
  crates/
    domain/             # types/invarianten/IDs; geen IO/UI
    application/        # use cases, ports, orchestration
    infrastructure/     # opslag, OS keystore, klok, eventbus
    ingestion/          # provider adapters, playlist parsers
    metadata/           # TMDB/andere providers met rate limits
    epg/                # XMLTV/timeline/mapping
    playback/           # player abstraction, tracks, source switching
    ui/                 # Rust GUI of frontend bridge na ADR
    test_support/       # fake ports, factories, fixture builders
  features/             # Gherkin .feature files en bindings
  tests/                # integration/e2e/performance
  docs/                 # ADRs, docs bewust in repo
```
De feitelijke UI-technologie kan webfrontend + Rust-host (bijv. Tauri) of native Rust desktop zijn; dit schema is framework-agnostisch. Kies op basis van betrouwbare player, native macOS-titlebar, a11y, GPU-EPG en developer tooling.

## 3. Domeinen en services
- **SpaceService:** lifecycle, selected Space, overrides, favorieten-scoping, playlist assignments.
- **PlaylistService:** M3U/Xtream (na legacy-verificatie), normalisatie, idempotente refresh, bronidentiteit, provenance en credential refs.
- **CatalogService:** normalized channels/movies/series/episodes, aliases, source-variants, stable IDs, dedup.
- **CategoryService:** originele provider-categorie immutable; eigen displaycategorie; genre-, provider-, Space-mapping; sortering.
- **MetadataService:** provider fetch/cache, confidence matching, manual overrides, ID links, rate limiting.
- **EpgService:** feeds/parsing, timezone, offset, channel mapping, interval query, gaps.
- **PlayerService:** open/close/swap stream, capability negotiation, tracks, quality, error fallback, progress.
- **DownloadService:** optionele capability, permission check, job queue, retry, encrypted? afh. op opslagbeslissing.
- **SearchService:** index over titles, genres, channels and people; normalized Unicode; per-Space filters.
- **AppearanceService:** tokens, gekozen global thema, Space override, OS integration.
- **MediaAssetService:** upload/crop/transcode, rights metadata, caching.

## 4. Architectuurcontracten
Use cases return typed results (`Result<T, DomainError>`), boundary adapters vertalen externe fouten. Trait-ports zoals `PlaylistRepository`, `MetadataProvider`, `EpgRepository`, `PlaybackBackend`, `ImageStore`, `SecretStore`, `Clock`. Dependency injection door composition root; idempotente write commands met transaction boundaries en request IDs. Events bevatten identifiers, geen gevoelige inhoud.

## 5. Persistence en schema
Opslagkeuze open (SQLite is kandidaat voor lokale app). Ontwerp migraties vanaf v1. Start met entiteiten: `Space`, `Playlist`, `PlaylistSyncRun`, `SourceItem`, `CatalogItem`, `ContentSource`, `Category`, `CategoryMapping`, `MetadataMatch`, `Favorite`, `WatchProgress`, `EpgChannel`, `EpgProgram`, `EpgMapping`, `ThemePreference`, `Asset`, `DownloadJob`, `AuditEvent`. Foreign keys, uniqueness/soft-delete, scope en revision/timestamp expliciet. Zie DATA_EN_CONTENT_MODELLEN.md.

## 6. Sync en data-integriteit
- Import staging → parse/validate → canonicalize → dedup/match → dry-run diff → atomische commit → index rebuild/incremental events.
- Bescherm user overrides en favorieten bij playlistupdates; soft-delete/retention bij tijdelijk verdwenen channels.
- Elke synchandeling biedt metrics, foutdetails, provider status en rollbackbaar resultaat waar mogelijk.
- Gebruik background jobs met cancel en progress; nooit UI-thread blokkeren.

## 7. Player technische spike (verplicht vóór implementatie)
Evalueer afspeelbackends tegen HLS, MPEG-TS, relevante codecs, subtitle/audio tracks, live seek/startover, fullscreen, PiP (optioneel), hardware acceleration, DRM-compatibiliteit, observability, macOS codesigning en distributierechten. Legacy-werkend is nuttig bewijs maar geen onvoorwaardelijk target. Capability API bepaalt welke UI-acties zichtbaar zijn.

## 8. Concurrency en performance
- Cancellation bij navigatie/search/refresh en race-safe player-source switch.
- Laatste-successful-result bij netwerkstoring; image caching; virtuele EPG/kanalen/filmgrids; streams op afzonderlijke task boundary, audiofocus MultiView.
- Initiële niet-bindende performance budgets: navigatie interactie <200ms op warme cache, zichtbare laden feedback <300ms, scroll stutter <16.7ms frame op referentie-hardware; valideer met metingen en realistische bibliotheken (>30k channels, >80k films).
- Benchmark cold indexing, playlist import, EPG 7d, zoeken, memory en player startup op meerdere apparaten.

## 9. Security en privacy
- Providercredentials/keys uitsluitend OS keystore; logs redacteren URL tokens, headers, auth, kijkgedrag.
- Untrusted playlist/EPG XML: limits op bestand, parsing time, redirects, allowed protocols, zip bombs, XXE voorkomen, input sanitization; SSRF-check bij user-supplied URLs.
- Medienamen en remote metadata ontsmetten bij rendering; veilige image formats, sandbox decoding, prevent path traversal.
- Analytics en crash reports opt-in; dataretentie en back-ups zichtbaar; secrets nooit in exports. Externe licenties en rechten per provider controleren.

## 10. Tests en BDD
- `.feature` specs met rust-bound step definitions (toolkeuze ADR), domeinunit-tests, contracttests adapters, integratietests tegen fixture server, macOS UI end-to-end tests, screenshot regressie, a11y en performance benchmarks.
- Voorbeelden: playlistrefresh behoudt favorieten; EPG volgt DST; user override wint van metadata; 2 streamfouten beïnvloeden andere MultiView tiles niet.
- Inject fake clocks, fake provider adapters, deterministic media streams. Testdata nooit van publieke IPTV-lijsten afhankelijk.

## 11. Release engineering
- CI gates: fmt/clippy/test, BDD, audit/licenses, SBOM, security scan, UI snapshots, install/launch smoke tests, macOS notarization/codesign als vereist.
- SemVer + schema migration versions, app auto-update pas na expliciete ADR; crash rollback en back-up voor migraties.
- Release channel dev/beta/stable, telemetrie privacyvriendelijk en uit tenzij opt-in.

## 12. Beslispunten die de eigenaar moet kunnen aanvullen
GUI-framework; opslag/db; player/backend; M3U/Xtream en supported provider types; TMDB/API policy; Mac App Store vs direct distribution; DRM/rechten; offline/downloadbeleid; MultiView limieten; accounts/sync; Windows/Linux scope; contentmoderatie/kindprofiel; credential/export policy; fontlicenties.

## 13. Referentie-repo audittemplate
Documenteer per feature: huidig bestand/module, observeerbaar gedrag, input/output, legacy bugs, regressierisico, testfixture, migratiebeslissing (KEEP BEHAVIOR / REDESIGN / DROP), afhankelijkheden. Leg resultaten vast als ADR en koppel aan schermnummers.
