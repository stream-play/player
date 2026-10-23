# Data- en contentmodel — voorgestelde invarianten

## Kernobjecten
| Object | Identiteit | Eigenschappen | Invariant |
|---|---|---|---|
| Space | UUID | name, description, coverAsset, accent, themeOverride | Eigen scope op favorieten, contentkeuze en categorie-overrides |
| Playlist | UUID | providerType, name, credentialRef, enabled, lastSync | Secret alleen als keystore-ref |
| SourceItem | (playlistId, providerItemId) | type, name, urlRef, language, quality | Bronidentiteit is niet hetzelfde als canonical content |
| CatalogItem | UUID | contentType, canonicalTitle, releaseYear | Stabiele identiteit onafhankelijk van poster en playlistnaam |
| ContentSource | UUID | catalogItemId, sourceItemId, priority | 0..n bronnen per canonieke titel |
| Category | UUID | title, description, heroAsset, thumbnailAsset, order, visible | Originele providernaam niet overschrijven |
| CategoryMapping | UUID | categoryId, sourceCategoryId, spaceOverride, rule | Dry-run en validatie vóór bulktoepassing |
| Favorite | (spaceId, itemId) | createdAt | Uniek per Space/content; blijft behouden bij refresh |
| WatchProgress | (spaceId, itemId/episodeId) | position, duration, updatedAt | Clamp 0..duration; episode apart |
| EpgProgram | provider+externalId/timerange | channelId, startUtc, endUtc, title | `start < end`; tijdweergave met zone |
| Asset | UUID | origin, fileRef, crop, attribution | Asset heeft uploadvalidatie en rights info |
| ThemePreference | global/space | preset, overrides | Eén van drie officiële presets; future custom read-safe |

## Mapping en precedence
Playback title: handmatige override > verified external metadata > provider title. Artwork: manual image > verified artwork > provider artwork > safe gradient. Categorie: handmatige Space override > global local mapping > normalized provider category > fallback Ongecategoriseerd. Provider refresh mag nooit handmatige metadata of mapping opzijzetten zonder expliciete user acceptance.

## Search
Unicode normalization (NFKC/normatieve strategie beslissen), diacritics-aware search, prefix+fuzzy met duidelijke ranking, beveiligde query grenzen. Search index bevat inhoud uit actieve Space inclusief alias en actor wanneer extern beschikbaar.

## Transacties
Provider imports en bulkmapping atomisch/idempotent; migration versioning; undo history optioneel maar sterk aanbevolen. Conflicts zichtbaar; gebruikersoverride heeft altijd afkomst en lastModified. Log wijzigingen aan mappings met redacted audit event.

## Import/export
Export zonder secrets tenzij afzonderlijke expliciete, beveiligde export-optie. Include schema version en portable asset paths, valideer checksums; restore dry-run en backup vooraf.

## Concurrency
Versiebeheerde entities voor conflict detection; concurrent playlistimport en editor drafts nooit stil overschrijven. UI toont stale-data conflict en keuze reload/merge waar toepasselijk.
