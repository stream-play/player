# StreamPlay 2.0 — Complete build- en styleguide

## 0. Status, bronnen en uitgangspunten
Deze gids beschrijft de **beoogde nieuwe applicatie**. Legacy-screenshots en 33 conceptmockups zijn visuele referenties, niet de technische waarheid. De vorige Rust-code dient als read-only inspiratie en bron van productgedrag, geen basis voor copy-paste zonder review. Beslissingen die nog niet zijn gevalideerd staan in `BESLISSINGEN_EN_RISICOS.md`.

## 1. Productprincipes
1. **Content first:** video, metadata en artwork krijgen visuele prioriteit, niet dozen vol controls.
2. **Rustige discovery, krachtige beheeromgeving:** content ontdekken moet emotioneel aanvoelen; configuratie betrouwbaar en precies.
3. **Player first:** video blijft spelen bij EPG of kanaalnavigatie waar technisch mogelijk.
4. **Per Space personaliseren:** alle settings onderscheiden global/default en Space override.
5. **Functional honesty:** badges, EPG, kwaliteitsinfo en downloads uitsluitend indien werkelijk beschikbaar.
6. **Accessible premium:** focus/contrast/gebruikscomfort winnen van animatie en decoratie.
7. **Offline-first voor lokale configuratie**; netwerkcontent kan beperkt beschikbaar zijn.
8. **BDD-first:** eerst gedrag en acceptatiecriteria, daarna code en visuals.

## 2. App-shell en navigatiemodel
- Native macOS venster met in thema geïntegreerde titelbalk (traffic lights behouden als systeemknoppen; drag region correct, dubbelklikgedrag OS-conform). Geen fake vensterknoppen in productie.
- Permanente context: actieve Space en globale zoekentry. Zijbalk met Home, Live TV, Films, Series, Favorieten, Verder kijken, Downloads, MultiView, Spaces, Configuratie, Instellingen. EPG kan via Live TV en player; exacte top-level positie kan UX-validatie volgen.
- Configuratie = inhoud/structuur/bronbeheer; Instellingen = voorkeuren, player, accessibility en technische opties.
- Navigatie: herstelt filters, scroll en afspeelpositie; gebruikt duurzame ID's; guards voor onopgeslagen wijzigingen; modals sluiten met ESC. Player (en minimumpanel) is apart persistent subsysteem.
- Beheeroppervlakken krijgen heldere tabellen/forms; cinematic branding mag data-integriteit niet belemmeren.

## 3. Drie officiële thema's
Alle waarden via **semantische tokens**, nooit verspreide hex-codes in componenten. Onderstaande startwaarden zijn *voorstellen* en worden met contrast- en screenshottests gevalideerd.

| Semantisch token | Cinematic Dark | Midnight Navy | Studio Light |
|---|---|---|---|
| canvas | `#070B13` | `#091925` | `#F5F7FB` |
| surface | `#101A2A` | `#11283B` | `#FFFFFF` |
| elevated | `#16263C` | `#18354A` | `#E9EFF6` |
| text-primary | `#F5F8FF` | `#F3F8FD` | `#142033` |
| text-secondary | `#B5C5D9` | `#B6CCDE` | `#4A5D73` |
| accent | `#2778FF` | `#26A1F4` | `#2563EB` |
| accent-violet | `#8A61FF` | `#7E78FF` | `#6D43D9` |
| border | `#29384D` | `#2C4860` | `#CED8E4` |
| danger | `#FC4D65` | `#F65A6C` | `#BA2441` |
| success | `#37CA91` | `#32C18C` | `#177F5B` |

Tokens ook definiëren voor: `hover`, `pressed`, `selected`, `focus-ring`, `disabled`, `divider`, `overlay-scrim`, `hero-gradient`, `window-chrome`, `player-control-surface`, `epg-now-line`. Thema-overname: global default → Space override → tijdelijke preview. Systeemthema-keuze is **gedrag**, geen vierde thema. Custom-token-JSON kan later bestaan, maar editor buiten v1-scope.

## 4. Typografie
- **Font:** Asap Sharp, optisch op macOS renderen. Controleer eerst correcte fontvarianten, rechten/licenties en redistributieregels. Voeg fontbestanden pas na verificatie toe aan de app.
- Gewichten: 400 body, 500 labels, 600 subheadings, 700 hero/headings. Geen onnodige all caps behalve eyebrow/status.
- Schaal (initieel): 12 caption, 14 secondary, 16 body, 18 cardheading, 22 section, 28 page, 36 detailheadline, 48–64 hero. Desktop-scaling en OS accessibility moeten afzonderlijk getest worden.
- Line-height: ~1.45 body, ~1.2 headings; truncation maximaal 2 regels voor kaarttitels met tooltip of detail op focus.
- Tabular figures voor EPG/voortgang. Fallbackfonts voor Arabisch en andere niet-gedekte scripts; geen tofu-glyphs.

## 5. ProIcons
- Verplicht primaire iconenset uit aangeleverde ZIP met **544 SVG's** (`proicons--*.svg`). Behoud de originele bronbestanden; bouw een name-to-component registry die SVG veilig inline rendert.
- Mapping naar semantic IDs (bijv. `nav.home`, `media.play`, `action.favorite`, `window.close`) en controleer dat de gekozen bronbestanden echt bestaan.
- Basisgrootten 16/20/24px, consistente stroke/optical alignment, currentColor waar veilig, compacte hit-target van >= 40px.
- Nieuwe iconen alleen wanneer pakket ontbreekt; stijlconsistent, geen mix met Lucide in de uiteindelijke app.
- Maak automatische icon-audit: ontbrekend bestand, dubbele semantic mapping, misvormde SVG, unsupported attributes.

## 6. Layout, grids, spacing
- Ontwerpbaseline **2560×1600 concept**; implementeer adaptief, niet pixel-absoluut.
- Tokens: spacing 4/8/12/16/20/24/32/40/48/64; radii 8/12/16/20; sidebar compact 72–88, expanded ca. 240; player-rail 280–360 afhankelijk viewport.
- Breekpunten **indicatief**: <1024 compact, 1024–1439 medium, >=1440 widescreen. Alleen aanpassen na echte desktop-usecases.
- Media: cards poster 2:3, backdrop 16:9 of 21:9, Space cover 16:9. `object-fit: cover`, focal point optioneel en slimme fallback.
- EPG tijdlijn virtueel horizontaal/verticaal, vaste kanaalkolom en tijdheader. Scrollposities behouden; Now-line in lokale tijd.
- Content grids moeten op lange namen, ontbrekend artwork en RTL kunnen reageren.

## 7. Componentenbibliotheek (verplicht)
AppShell, NativeTitlebarIntegration, Sidebar, GlobalSearch, SpaceSwitcher, Button (primary/secondary/ghost/danger), IconButton, MediaCard, ChannelCard, GenreCard, SpaceCard, Hero, ContentRail, PosterGrid, StatusBadge, FilterChip, Select, Combobox, Tooltip, Popover, Dialog, Drawer, Toast, Skeleton, EmptyState, ErrorState, Progress, MetadataRow, CastAvatar, EPGTimeline, EPGProgramBlock, PlayerControls, TrackMenu, FeedPicker, FormField, FileUpload, ImageCropper, ReorderList, ConfirmationDialog.

Componenten krijgen typed props, token-gebaseerde styling, states/defaults, focus, disabled en a11y-tests. Geef geen logica voor datasource of playlistmapping aan pure presentational components.

## 8. Motion en feedback
- Gebruik motion spaarzaam: hover 120–180ms, panel reveal 180–240ms; respecteer reduce-motion en OS-preferentie.
- Posterhover: lichte scale/glow, geen bewegende layout. Playercontrols automatisch verbergen bij inactivity maar zichtbaar bij focus of muis; geen timed keyboard traps.
- Feedback: toast voor niet-destructief resultaat, inline errors voor forms, bevestigingsdialoog voor destructieve acties, undo bij verwijdering waar mogelijk.
- Skeletons behouden layout; geen spinner over volledig scherm als partiële data al bruikbaar is.

## 9. Schermtoestanden en UX-contracten
Voor elk van de 33 schermen: loading, populated, empty, partial, error, offline, unauthorized indien relevant, reduced-motion, keyboard-only, compact viewport, long strings en RTL. Iedere primaire actie heeft response, foutpad, retry/undo, en preventie van dubbelklikken waar nodig.

## 10. Accessibility
Doel **WCAG 2.2 AA** voor UI. Contrast >= 4.5:1 body, >=3:1 grote tekst en noodzakelijke non-text UI. Focus indicator goed zichtbaar; labels voor iconbuttons; semantische headings; toetsenbordnavigatie door rails, tabs, modals, EPG en MediaPlayer; expliciete screenreaderstatus van live en progress; geen autoplay met audio; subtitels zijn aanpasbaar; niet uitsluitend kleur voor status.

## 11. Afbeeldingen en assets
- Gebruik alleen assets waarvan gebruiksrechten bevestigd zijn. Designmockups met illustratieve fictieve films zijn **geen** productie-assets of feitelijke metadata.
- User uploads: MIME detecteren op inhoud, type/size limieten, image decoding in sandbox/veilige library, transcode, EXIF strip, dimension bounds, thumbnails/cache; verwijder exif/private paden uit exports.
- Media CDN-caching met TTL, transparante cache refresh en handmatige overrides die nooit door automatische sync worden overschreven.

## 12. Lokalisatie
Primair Nederlands; architectuur voor Engels/RTL. Alle teksten via i18n keys, 24-uursnotatie optioneel per locale, tijdzone per gebruiker; UTC internal. Test Arabische contenttitels, niet-Latijnse fonts en diacritics.

## 13. Buildregels & codekwaliteit
- Rust stable toolchain pinned via `rust-toolchain.toml` na beslissing; workspace met domain/application/adapters/ui en testhelpers; `cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test` en audit/licentiecheck in CI.
- Geen ongedocumenteerde `unwrap()`/`expect()` in runtime-I/O; typed errors en recovery; geen panics door ongeldige playlists/media.
- Dependency-injection via traits, deterministische tests, geen verborgen globale mutable state; UI frameworks pas na ADR.
- Observability gestructureerd met trace-ID's maar zonder wachtwoorden, tokens, playlists met credentials of gevoelige kijkgeschiedenis.
- BDD-first acceptatie per change; minimaal één happy path, empty en failure path per scherm, met aanvullende domeinscenario's.

## 14. Definition of Ready / Done
**Ready:** scenario's, doel, screenspec, data-contract, dependencies en risico's beschreven, verantwoordelijke agent en reviewer bekend, risico's en open besluiten zichtbaar. **Done:** geautomatiseerde scenario's groen, lint/type/security checks groen, geslaagde UI snapshot en a11y review, geen kritieke review findings, documentatie bijgewerkt, PR en CI groen, product owner-goedkeuring voor belangrijke beslissingen.

## 15. Anti-patterns
Geen één-op-één migratie van legacy-UI; geen megacomponent; geen direct HTTP in view; geen hardcoded kleurwaarden; geen fake download/support claim; geen vertrouwen in AI-gegenereerde tekst als datamodel; geen copy van ongeteste oude technische schuld; geen secrets in repo.
