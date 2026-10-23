# Legacy audit evidence ledger

Audit date: 2026-10-23. Source access was read-only. The only source commands used were the allowlisted Git and text inspection commands from JOB-0017. No source files, asset bytes, fixture contents or real endpoints are reproduced here.

## 1. Baseline

| Repository | Snapshot | HEAD before | HEAD equals snapshot | Commits snapshot..HEAD | Snapshot ancestor of HEAD | HANDOVER `040b2b5` / `72dc8a5` ancestor of snapshot; exit | HANDOVER ancestor of HEAD; exit | Porcelain before | HEAD after | Porcelain after |
| --- | --- | --- | --- | ---: | --- | --- | --- | ---: | --- | ---: |
| `~/Projects/iptv` | `7469f2a` | `7469f2a60640850fa5fd3c710dad9124594a9365` | yes | 0 | yes (0) | `040b2b5`: yes (0); `72dc8a5`: unknown (object absent, 128) | `040b2b5`: yes (0); `72dc8a5`: unknown (object absent, 128) | 6 | `7469f2a60640850fa5fd3c710dad9124594a9365` | 6 |
| `~/Projects/iptv/player` | `869ce22` | `869ce22b96569fb3c9f5da616fbcd042966b3b6c` | yes | 0 | yes (0) | `72dc8a5`: yes (0); `040b2b5`: unknown (object absent, 128) | `72dc8a5`: yes (0); `040b2b5`: unknown (object absent, 128) | 0 | `869ce22b96569fb3c9f5da616fbcd042966b3b6c` | 0 |

Each repository's corresponding HANDOVER commit resolves and is an ancestor of both snapshot and HEAD. The other repository's HANDOVER object is absent locally; no cross-repository ancestry conclusion is inferred. A count-only `--untracked-files=all` porcelain probe found 23 untracked paths in v1 and 0 in player; ignored counts remain unknown. No untracked or ignored path was inspected or named.

## 2. Red evidence (before edits)

The red probes read committed `main` objects with `git show main:<path>` before completing the inherited draft. They do not assume the inherited worktree was clean.

| Gate | Command/probe | Red output |
| --- | --- | --- |
| G1 | `git show main:docs/plan/LEGACY_AUDIT_LEDGER.md` | `fatal: path ... does not exist in main`; no resolver index existed. |
| G2 | `git show main:<each listed job/ADR>`, count the generic README line-3 citation | 10 hits: nine domain/audit/release job files and ADR-009. |
| G2 | `git show main:docs/adr/ADR-011-proicons.md`, count `shell\\.rs:4` | 1 hit. |
| G3 | `git show main:docs/plan/LEGACY_CAPABILITY_MATRIX.md`, count row LA IDs | 27 capability/player rows; 0 LA IDs. |
| G3 | `git show main:docs/plan/OPEN_QUESTIONS.md`, count headings and Status lines | 18 headings; duplicate OQ-013 and OQ-014; 0 Status lines. |
| G4 | `/tmp/job0017_gates.py` `hits()` on `/tmp/job0017_fixture.txt` (created and removed outside the repository) | 10 planted; 10 caught. Categories: URL, IPv4, email, user path, project ID, credential assignment, provider path (two forms), signing label and team-ID form. |

## 3. Evidence ledger

Verdict vocabulary follows the spec. Live citations use the full verified source HEADs from §1; abbreviated commit labels below identify the snapshot because each has zero later commits.

| ID | Capability/asset | Snapshot commit | Original path:line | Live commit | Live path:line | Observed behavior | Delta | Verdict | Matrix/OQ link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LA-001 | M3U parsing | `7469f2a` | `crates/providers/src/m3u.rs:121` | `7469f2a` | `crates/providers/src/m3u.rs:121` | Parser constructor remains at cited line. | unchanged | port with characterization tests first | Matrix M3U; OQ-014 |
| LA-002 | Xtream import | `7469f2a` | `crates/providers/src/xtream.rs:92` | `7469f2a` | `crates/providers/src/xtream.rs:92` | Import entry point remains at cited line. | unchanged | port with characterization tests first | Matrix Xtream; OQ-014 |
| LA-003 | XMLTV parsing | `7469f2a` | `crates/providers/src/xmltv.rs:33` | `7469f2a` | `crates/providers/src/xmltv.rs:33` | Reader constructor remains at cited line. | unchanged | port with characterization tests first | Matrix EPG; OQ-014 |
| LA-004 | Live category lookup | `7469f2a` | `crates/store/src/live_categories.rs:113` | `7469f2a` | `crates/store/src/live_categories.rs:113` | Category query remains at cited line. | unchanged | port with characterization tests first | Matrix categories; OQ-014 |
| LA-005 | Space state | `7469f2a` | `crates/store/src/spaces.rs:12`; `space_state.rs:5` | `7469f2a` | same | Space record and space-scoped state opener remain at cited lines. | unchanged | re-implement from behavior | Matrix Spaces/Favorites; OQ-006 |
| LA-006 | Playback backend citation | `7469f2a` | `crates/playback/src/lib.rs:220` | `7469f2a` | `crates/playback/src/lib.rs:257` | Cited line 220 was a pixel-count limit; line 257 declares the Player backend interface. | changed | re-implement from behavior | Matrix Player backend; OQ-010 |
| LA-007 | Audit status citation | `7469f2a` | `docs/src/pages/audit.md:10` | `7469f2a` | `docs/src/pages/audit.md:10` | Audit narrative describes the local app review. | unchanged | re-implement from behavior | TECH-AUDIT-LEGACY |
| LA-008 | Font citation correction | `7469f2a` | `crates/desktop/src/theme.rs:6` | `7469f2a` | `crates/desktop/src/theme.rs:165-170` | Original theme citation declares Palette; actual v1 font embedding uses `include_bytes!` at theme lines 165-170. | changed | re-implement from behavior | Matrix Typography; OQ-019 |
| LA-009 | Asap Sharp fonts and owner direction | `869ce22` | absent from snapshot | `869ce22` | Regular (65,476 bytes; SHA-256 `210c619cd84c6a25`); SemiBold (65,552 bytes; `6b6710a90fdb3c69`); OFL.txt (4,395 bytes; `3f0a89775c793311`) | Manifest pins Omnibus-Type/Asap_Sharp at `41d013ad7c374fd7fc3f5fc99571b582020d509b`; OFL 1.1, no Reserved Font Name. APR-0006 directs static re-derivation from upstream variable font and shipping OFL.txt. | new-in-live | do not reuse | OQ-009, OQ-019: bundled instances are replaced by upstream-derived instances |
| LA-010 | ProIcons | `7469f2a` | absent from snapshot | `869ce22` | `crates/desktop/assets/icons/` (26 SVGs, LICENSE.txt); manifest source at lines 10-18; embed at `crates/desktop/src/assets.rs:62-65` | Player bundles Proicons 4.13.7 and embeds SVGs. APR-0005 authorized checking the supplied archive; owner direction identifies `resources/proicons @ 1c810f0` for downstream sourcing. | new-in-live | reuse asset as-is pending licence/owner confirmation | OQ-020 |
| LA-011 | Flags | `7469f2a` | `crates/desktop/assets/flags/README.md:3-4` | `7469f2a` | `crates/desktop/assets/flags/README.md:3-4` | Tracked flag bundle documents an upstream pin and local loading; license file exists. | unchanged | reuse asset as-is pending licence/owner confirmation | OQ-009 |
| LA-012 | Brand and decorative artwork | `7469f2a` | absent from snapshot | `7469f2a` | `crates/desktop/assets/README.md:3-34` | README describes generated artwork and authored application icon; bytes were not opened. | new-in-live | reuse asset as-is pending licence/owner confirmation | OQ-014 |
| LA-013 | TMDB mark | `7469f2a` | absent from snapshot | `7469f2a` | `crates/desktop/assets/README.md:37` | Attribution source is documented; SVG bytes were not opened. | new-in-live | reuse asset as-is pending licence/owner confirmation | OQ-011 |
| LA-014 | Setup/home artwork provenance | `7469f2a` | absent from snapshot | `7469f2a` | `crates/desktop/assets/README.md:6-22` | README identifies the artwork as generated and decorative. | new-in-live | reuse asset as-is pending licence/owner confirmation | OQ-014 |
| LA-015 | Flags licence | `7469f2a` | `crates/desktop/assets/flags/LICENSE` | `7469f2a` | tracked file present (1,087 bytes) | Licence file presence is confirmed; its text is not reproduced. | unchanged | reuse asset as-is pending licence/owner confirmation | OQ-009 |
| LA-016 | Player catalogue tests | `869ce22` | `crates/store/tests/catalogue.rs:5` | `869ce22` | `crates/store/tests/catalogue.rs:5` | Test fixture constructor is present. | unchanged | port with characterization tests first | Matrix player/store; OQ-015 |
| LA-017 | Player M3U parser | `869ce22` | `crates/providers/src/m3u.rs:5` | `869ce22` | `crates/providers/src/m3u.rs:5` | Parser attribute helper is present. | unchanged | port with characterization tests first | Matrix player/providers; OQ-014 |
| LA-018 | v1/player baseline | `7469f2a` / `869ce22` | `HANDOVER.md:15-16` | both snapshot HEADs | §1 hashes, ancestry and counts | Both named snapshots are the exact live HEADs; handover heads are ancestors. | unchanged | re-implement from behavior | OQ-002 |
| LA-019 | Fixture host provenance | `869ce22` | absent from snapshot | `869ce22` | `crates/providers/tests/network.rs` | Two short, non-reserved host literals occur in a tracked network test; provenance cannot be established from the test alone. No content is reproduced. | absent-unknown | unknown — evidence missing | OQ-021 |
| LA-020 | Watch history | `7469f2a` | `crates/desktop/src/app/watch.rs:4` | `7469f2a` | same | Watch UI entry remains present. | unchanged | re-implement from behavior | Matrix History |
| LA-021 | Command palette | `7469f2a` | `crates/desktop/src/app/palette.rs:31` | `7469f2a` | same | Palette search entry remains present. | unchanged | re-implement from behavior | Matrix Search |
| LA-022 | Subtitles | `7469f2a` | `crates/providers/src/subtitles.rs:62` | `7469f2a` | same | Subtitle provider path remains present. | unchanged | port with characterization tests first | Matrix Tracks |
| LA-023 | Picture in Picture | `7469f2a` | `crates/desktop/src/app/pip.rs:5` | `7469f2a` | same | Window entry remains present. | unchanged | re-implement from behavior | Matrix PiP |
| LA-024 | MultiView | `7469f2a` | `crates/desktop/src/app/multiview.rs:70` | `7469f2a` | same | MultiView cap statement remains present. | unchanged | port with characterization tests first | Matrix MultiView |
| LA-025 | Downloads | `7469f2a` | `crates/downloads/src/transfer.rs:10` | `7469f2a` | same | Transfer entry remains present. | unchanged | port with characterization tests first | Matrix Downloads |
| LA-026 | Notifications | `7469f2a` | `crates/desktop/src/notifications.rs:145` | `7469f2a` | same | Notification path remains present. | unchanged | re-implement from behavior | Matrix Reminders |
| LA-027 | Settings | `7469f2a` | `crates/desktop/src/app/settings.rs:112` | `7469f2a` | same | Settings entry remains present. | unchanged | re-implement from behavior | Matrix Settings |
| LA-028 | Persistence | `7469f2a` | `crates/store/src/lib.rs:28` | `7469f2a` | same | Store migration entry remains present. | unchanged | port with characterization tests first | Matrix Persistence |
| LA-029 | Stored credentials | `7469f2a` | `crates/store/src/subtitle_accounts.rs:64` | `7469f2a` | same | Account storage path remains present; no values inspected. | unchanged | re-implement from behavior | Matrix Secret storage |
| LA-030 | Packaging scripts | `7469f2a` | `README.md:16`, `README.md:23` | `7469f2a` | `scripts/build-macos.sh:11-16`; `scripts/build-macos.sh:42-66` | Build bundles and optionally signs a macOS app; original README citation was insufficient. | changed | re-implement from behavior | Matrix Packaging/Build scripts; OQ-004 |
| LA-031 | CI workflows | `869ce22` | absent from snapshot | `869ce22` | `.github/workflows/ci.yml:2-7`; `.github/workflows/release.yml:2-7` | Player HEAD tracks CI and release workflow triggers. | new-in-live | re-implement from behavior | Matrix CI workflows |
| LA-032 | Cargo build config | `7469f2a` / `869ce22` | absent from snapshot | both | `Cargo.toml:25 @ 7469f2a`; `Cargo.toml:23 @ 869ce22` | Both HEADs track lockfiles and release profiles; neither manifest tree declares a feature table. | new-in-live | re-implement from behavior | Matrix Cargo; OQ-010 |
| LA-033 | Tracked test fixtures | `869ce22` | absent from snapshot | `869ce22` | `crates/store/tests/fixtures/schema-v1.sql` | Test sources and one SQL fixture are tracked; inputs remain audit evidence only. | new-in-live | do not reuse | Matrix Test fixtures; OQ-021 |
| LA-034 | Discovery | `7469f2a` | `crates/store/src/discovery.rs:5` | `7469f2a` | same | Discovery store entry remains present. | unchanged | re-implement from behavior | Matrix Metadata |
| LA-035 | Playlist sync | `7469f2a` | `crates/store/src/live.rs:152` | `7469f2a` | `crates/store/src/live.rs:5` | Original line decorates entries; line 5 declares the transactional sync function. | changed | port with characterization tests first | Matrix Playlist sync |
| LA-036 | Themes | `7469f2a` | `crates/desktop/src/theme.rs:78` | `7469f2a` | same | Theme palette entry remains present. | unchanged | re-implement from behavior | Matrix Themes |
| LA-037 | Player desktop shell | `869ce22` | `crates/desktop/src/app.rs:20` | `869ce22` | same | Shell entry remains present. | unchanged | re-implement from behavior | Matrix player desktop |
| LA-038 | Player store and vault | `869ce22` | `crates/store/src/lib.rs:18`; `crates/vault/src/lib.rs:14` | `869ce22` | same | Store and vault interfaces remain present. | unchanged | port with characterization tests first | Matrix player store/vault |
| LA-039 | Player providers | `869ce22` | `crates/providers/src/lib.rs:12` | `869ce22` | same | Provider interface remains present. | unchanged | port with characterization tests first | Matrix player providers |
| LA-040 | Player playback | `869ce22` | `crates/playback/src/lib.rs:7` | `869ce22` | same | Playback module remains present. | unchanged | port with characterization tests first | Matrix player playback |
| LA-041 | Player domain | `869ce22` | `crates/domain/src/lib.rs:3` | `869ce22` | same | Domain module remains present. | unchanged | re-implement from behavior | Matrix player domain |

## 4. Inventories

Tracked-file scope is `git ls-tree -r --long HEAD` only. File contents and binary assets were not copied.

### (a) Fonts

| Repository | Tracked font | Bytes | SHA-256 (first 16) | Licence/manifest |
| --- | --- | ---: | --- | --- |
| v1 | `crates/desktop/assets/NotoSans.ttf` | 2,049,096 | `bfb7bb691513f12e` | `crates/desktop/assets/OFL.txt` present (SHA-256 `cee9892f9f0cc8fe`); Asap Sharp absent |
| player | `crates/desktop/assets/fonts/AsapSharp-Regular.ttf` | 65,476 | `210c619cd84c6a25` | `OFL.txt` present; manifest pins upstream `Omnibus-Type/Asap_Sharp @ 41d013ad7c374fd7fc3f5fc99571b582020d509b` |
| player | `crates/desktop/assets/fonts/AsapSharp-SemiBold.ttf` | 65,552 | `6b6710a90fdb3c69` | same OFL and manifest |

Manifest source hash `0c5f2706889214e8102fc97890e34d5f3a02f5203c198c7711987efcf6124e23`; OFL.txt SHA-256 first 16 `3f0a89775c793311`. v1 embeds Noto Sans from `crates/desktop/src/theme.rs:165-170 @ 7469f2a`; player embeds Asap Sharp in `crates/desktop/src/assets.rs:188-193 @ 869ce22`. APR-0006: downstream must re-derive static instances from the pinned upstream variable file and ship OFL.txt.

### (b) ProIcons

Player HEAD tracks 26 SVG icon files and `icons/LICENSE.txt` (1,064 bytes, SHA-256 `1668412af87d0d96`, MIT); manifest lines 10-18 identify Proicons 4.13.7 and source metadata. For example, tracked `icons/add.svg` is 223 bytes (SHA-256 `f382a17fa76019b3`). `crates/desktop/src/assets.rs:62-65 @ 869ce22` embeds an icon. The owner-designated downstream source is `resources/proicons @ 1c810f0`, which tracks 544 SVGs plus LICENSE.txt and README.md. The authorized archive contains 544 SVG entries. Only names/counts and digests were inspected; no asset bytes were copied. Exact archive-to-pin content equivalence remains unknown.


| Player ProIcons SVG | Bytes | SHA-256 prefix |
| --- | ---: | --- |
| `crates/desktop/assets/icons/add.svg` | 223 | `f382a17fa76019b3` |
| `crates/desktop/assets/icons/arrow-left.svg` | 299 | `85dcfdea23c05ba0` |
| `crates/desktop/assets/icons/cancel.svg` | 231 | `5186a48cc4b70464` |
| `crates/desktop/assets/icons/checkmark.svg` | 252 | `1c4f78b27db0d9f8` |
| `crates/desktop/assets/icons/chevron-down.svg` | 248 | `f8eba258e4944ad9` |
| `crates/desktop/assets/icons/chevron-up.svg` | 249 | `f58ebda5b32770d5` |
| `crates/desktop/assets/icons/delete.svg` | 435 | `c0baa8b460533f76` |
| `crates/desktop/assets/icons/document.svg` | 289 | `457a486e14563928` |
| `crates/desktop/assets/icons/filter-cancel.svg` | 563 | `1eb80e2d215c2645` |
| `crates/desktop/assets/icons/folder-open.svg` | 522 | `4505788c607cdc17` |
| `crates/desktop/assets/icons/globe.svg` | 429 | `d9795b876a5962cd` |
| `crates/desktop/assets/icons/home.svg` | 469 | `48ca4ab319992f66` |
| `crates/desktop/assets/icons/info.svg` | 314 | `0b434bed09d0414c` |
| `crates/desktop/assets/icons/keyboard-command.svg` | 459 | `831270057a796cad` |
| `crates/desktop/assets/icons/link.svg` | 346 | `c63e975efe5d4c51` |
| `crates/desktop/assets/icons/movie.svg` | 334 | `c259668dcda267a3` |
| `crates/desktop/assets/icons/pencil.svg` | 405 | `3e225beae72838ed` |
| `crates/desktop/assets/icons/person-circle.svg` | 404 | `3069fe88537ab2ef` |
| `crates/desktop/assets/icons/pin-off.svg` | 489 | `370be705334a67f8` |
| `crates/desktop/assets/icons/pin.svg` | 432 | `0d2dbd00f7961420` |
| `crates/desktop/assets/icons/search.svg` | 277 | `2ee4ad22fad80a6f` |
| `crates/desktop/assets/icons/server.svg` | 614 | `11a3fe5afb359145` |
| `crates/desktop/assets/icons/settings.svg` | 610 | `62289728106df70c` |
| `crates/desktop/assets/icons/star.svg` | 551 | `26e7b1718ca3795b` |
| `crates/desktop/assets/icons/tv.svg` | 266 | `f6db20e37df69c1d` |
| `crates/desktop/assets/icons/window-multiple.svg` | 381 | `29ede168be038833` |

### (c) Flags

v1 and player each track 250 SVG flags plus README and LICENSE (252 entries); README pins `lipis/flag-icons` at `ac7e0eb3259eb62aa6100c435607e2fe03896a97`, states MIT and local loading. Player file presence was counted from tracked HEAD.

### (d) Brand and app icon

| Repository | Path | Bytes | SHA-256 | File type |
| --- | --- | ---: | --- | --- |
| v1 | `crates/desktop/assets/icon/streamplay.svg` | 1,928 | `b585901d38b36b1ef8766ac7ac146306fce9943b8b6c1052948062f5cf7aad0c` | SVG |
| v1 | `crates/desktop/assets/icon/streamplay.png` | 81,851 | `533609ba3459ca738f8fac30e5137fd7b40ee92f44e25bc35c6d5b3571c557cd` | PNG |
| v1 | `crates/desktop/assets/icon/StreamPlay.icns` | 338,074 | `07dd3e6ca7f120252f98408d907988ef48b57bc3c18142ea21832718ee04b567` | ICNS |
| player | `crates/desktop/assets/branding/streamplay.svg` | 1,928 | `b585901d38b36b1ef8766ac7ac146306fce9943b8b6c1052948062f5cf7aad0c` | SVG |
| player | `crates/desktop/assets/branding/streamplay.png` | 81,851 | `533609ba3459ca738f8fac30e5137fd7b40ee92f44e25bc35c6d5b3571c557cd` | PNG |

### (e) Decorative artwork

v1 README marks both artworks generated. Neither image was opened.

| Path | Bytes | SHA-256 | File type |
| --- | ---: | --- | --- |
| `crates/desktop/assets/setup-cinema.png` | 2,764,292 | `9eca7c112d75ec59166c6dfb22b520b3fe16f82f42aa09dfa00c297aa474cc6a` | PNG |
| `crates/desktop/assets/home-banner.png` | 1,718,199 | `f9ff152e1060cf6fd7ae297898a41b9d61bd625350d0f8d34ba29f21bb6b4502` | PNG |
| `crates/desktop/assets/home-banner.prompt.txt` | 774 | `7ff4f0a8cbe2c004` | text prompt, generated-art provenance |

Player tracks its own branding icon, but no matching decorative artwork was inventoried in this pass.

### (f) Third-party marks

v1 tracks `crates/desktop/assets/tmdb.svg` (2,065 bytes, SHA-256 prefix `8e7b30f73a402069`, SVG); assets README attributes it to the TMDB mark resource. No other third-party mark was identified in the tracked asset tree.

### (g) Reference screenshots

v1 tracks these references; may depict user library: not opened or described.

| Path | Bytes | SHA-256 | Type |
| --- | ---: | --- | --- |
| `.impeccable/references/iptv-categories.png` | 1,911,947 | `04a77ce205144adb0aff21ecbe8549c46cc6b4b3eed7f5c4c4961df6262ac0ab` | PNG |
| `.impeccable/references/iptv-desktop.png` | 2,160,581 | `69c8e2896e4191cf8dfadae8413113ce5772ef38fc5c16921f5c9d77c4d12289` | PNG |
| `.impeccable/references/iptv-home.png` | 2,066,861 | `fd246192ad174ac65e4e7fface2c4dc0d0b85ae5d17307cb655e55ebed1b6848` | PNG |
| `.impeccable/references/iptv-setup.png` | 1,646,355 | `93f31f3b21f12650fafc8da28db787681b551da5a552d84f67b5f0a2a74275c4` | PNG |

### (h) Fixtures

The table inventories tracked test files by path, size and format. Contents were not quoted. Classification uses the read-only URL/IP and key-assignment scan below; network-test host provenance remains unknown.

| Repository | Path | Bytes | Format | Classification |
| --- | --- | ---: | --- | --- |
| v1 | `crates/store/tests/catalogue.rs` | 48,889 | Rust | synthetic |
| player | `crates/desktop/tests/shell.rs` | 3,960 | Rust | synthetic |
| player | `crates/domain/tests/live.rs` | 4,475 | Rust | synthetic |
| player | `crates/domain/tests/shell.rs` | 4,623 | Rust | synthetic |
| player | `crates/playback/tests/address.rs` | 3,882 | Rust | synthetic |
| player | `crates/playback/tests/controller.rs` | 18,397 | Rust | synthetic |
| player | `crates/providers/tests/imports.rs` | 7,676 | Rust | synthetic |
| player | `crates/providers/tests/network.rs` | 6,695 | Rust | unknown |
| player | `crates/providers/tests/parsers.rs` | 4,498 | Rust | synthetic |
| player | `crates/store/tests/catalogue.rs` | 14,853 | Rust | synthetic |
| player | `crates/store/tests/fixtures/schema-v1.sql` | 539 | SQL | synthetic |
| player | `crates/store/tests/live.rs` | 18,268 | Rust | synthetic |
| player | `crates/store/tests/references.rs` | 3,883 | Rust | synthetic |
| player | `crates/vault/tests/encryption.rs` | 3,451 | Rust | synthetic |

Pattern scan on tracked test trees, output limited to match counts: v1 URL/IP-like lines 40, credential-like key lines 1; player URL/IP-like lines 49, credential-like key lines 8. A second URL parser found zero non-reserved IPv4 addresses. The apparent network addresses in playback tests are loopback. `crates/providers/tests/network.rs` contains two short non-reserved host literals; their provenance remains unknown (LA-019, OQ-021). The remaining test files use synthetic constructions or reserved hosts. No possible content is quoted.

### (i) Scripts

| Repository | Tracked script paths and purpose | Tools / decisive behavior |
| --- | --- | --- |
| v1 | `scripts/audit-dependencies.py` dependency audit; `build-icon.sh` icon conversion; `build-macos.sh` bundle build/sign; `build-windows.sh` Windows build; `bundle_libs.py` library bundling; `check.sh` checks; `create-local-signing-identity.sh` local identity setup; `entitlements.plist` signing entitlements; `live-bench.sh` benchmark; `live-drop-test.sh` live drop check; `run-local.sh` local launch; `windows/Dockerfile` build image. | Icon tools `rsvg-convert`, `sips`, `iconutil` at `crates/desktop/assets/README.md:32-34 @ 7469f2a`. `build-macos.sh` uses `codesign` at lines 51-63; identity is `<redacted:identity>`. `build-windows.sh` invokes cargo and curl at lines 32-44 (downloads only). `check.sh` invokes cargo at lines 5-7. Local identity script uses `security` at lines 16-43. No notarization or upload statement verified. |
| player | `scripts/check-foundation.py`; `check-platform-dependencies.py`; `check-pr-title.py`; `check-release.py`; `verify-assets.py` (validation/release checks from names and entry points). | Python 3 entry points at line 1 in each file; dependency checker invokes platform tooling at lines 16-29. No signing or notarization match in tracked scripts. `.github/workflows/release.yml:74 @ 869ce22` uploads artifacts and stages a release through a later job; see §4(k). |

No script was executed. The following per-file entries identify headers, argument entry points and external tools; dynamic behavior was not tested.

| Tracked file | Header/argument evidence and purpose | External tools | Signs / notarizes / uploads |
| --- | --- | --- | --- |
| v1 `scripts/audit-dependencies.py` | imports and argument parser at lines 1-7; dependency metadata audit | Python 3, network fetch | no / no / no |
| v1 `scripts/build-icon.sh` | line 2 and conversion lines 10-16; derives app icon formats | `rsvg-convert`, `sips`, `iconutil` | no / no / no |
| v1 `scripts/build-macos.sh` | build lines 11-16, sign lines 42-63, ZIP line 66 | cargo, Python 3, `codesign`, `ditto` | optional `<redacted:identity>` / no / no |
| v1 `scripts/build-windows.sh` | container build lines 13-32, dependency download lines 37-47, ZIP line 74 | Docker, cargo in container, curl, 7z, unzip, zip | no / no / no; downloads dependencies |
| v1 `scripts/bundle_libs.py` | native library scan/copy lines 24, 83-103 | Python 3, `otool`, `install_name_tool` | no / no / no |
| v1 `scripts/check.sh` | lines 2, 5-7; formatting, lint and test gate | cargo | no / no / no |
| v1 `scripts/create-local-signing-identity.sh` | header lines 2-7 and keychain check line 16; local identity setup | `security` | creates local `<redacted:identity>` / no / no |
| v1 `scripts/entitlements.plist` | signing entitlement data, not executable | consumed by `codesign` | no / no / no |
| v1 `scripts/live-bench.sh` | header lines 2-3, build line 10, generated stream line 12 | cargo, ffmpeg | no / no / no |
| v1 `scripts/live-drop-test.sh` | header line 2, generated stream line 8, build line 11 | cargo, ffmpeg | no / no / no |
| v1 `scripts/run-local.sh` | line 4; local desktop run | cargo | no / no / no |
| v1 `scripts/windows/Dockerfile` | container build recipe | Docker | no / no / no |
| player `scripts/check-foundation.py` | tracked-file and workflow checks lines 10-33 | Python 3, Git | no / no / no |
| player `scripts/check-platform-dependencies.py` | argument parser line 10, offline dependency tree lines 29-31 | Python 3, cargo | no / no / no |
| player `scripts/check-pr-title.py` | title-format validation at entry point lines 1-7 | Python 3 | no / no / no |
| player `scripts/check-release.py` | header line 2, Git ancestry checks lines 16-19 | Python 3, Git | no / no / no |
| player `scripts/verify-assets.py` | digest verification lines 3-19 | Python 3 | no / no / no |

The player release workflow uploads build artifacts at `.github/workflows/release.yml:74 @ 869ce22` and invokes release creation at `.github/workflows/release.yml:122-125 @ 869ce22`. Neither repository has a tracked notarization script.

### (j) Cargo features and build config

| Repository | Tracked manifests | `[features]` | `[profile.*]` | Target-specific dependencies |
| --- | --- | --- | --- | --- |
| v1 | Root; `crates/cli`, `desktop`, `domain`, `downloads`, `playback`, `providers`, `store` | none found | root release profile at `Cargo.toml:25 @ 7469f2a` | `desktop`: muda, objc2/app-kit, block2, objc2-foundation at `crates/desktop/Cargo.toml:26 @ 7469f2a`; `downloads`: libc at `crates/downloads/Cargo.toml:15 @ 7469f2a` |
| player | Root; `crates/desktop`, `domain`, `playback`, `providers`, `store`, `vault` | none found | root release profile at `Cargo.toml:23 @ 869ce22` | `desktop`: muda at `crates/desktop/Cargo.toml:22 @ 869ce22`; `providers`: libc at `crates/providers/Cargo.toml:23 @ 869ce22`; `vault`: Apple/Windows native keyring stores at `crates/vault/Cargo.toml:18 @ 869ce22` and `crates/vault/Cargo.toml:21 @ 869ce22` |

Both track `Cargo.lock`. v1 lockfile: 133,419 bytes, SHA-256 `451a3fa655f75b965fcb517b2277375563641391cd68d136f52589677f169a8a`, 522 package entries. Player lockfile: 133,352 bytes, SHA-256 `d71499c9fecb416dfc882457d716fd6204b87944f88ee0c066e67d429dac0ea1`, 520 package entries. A targeted package-name scan for ffmpeg/mpv/gstreamer/webkit/symphonia/libav/rodio found no matches; full native/codec dependency classification remains open at OQ-010.

### (k) CI and workflow files

| Repository | Workflow | Trigger | Release/signing |
| --- | --- | --- | --- |
| v1 | none tracked at HEAD | n/a | n/a |
| player | `.github/workflows/ci.yml:2-7 @ 869ce22` | push, schedule, pull_request | no signing match found |
| player | `.github/workflows/dependency-review.yml:1-6 @ 869ce22` | pull_request | no release/signing |
| player | `.github/workflows/release.yml:2-7 @ 869ce22` | push and workflow_dispatch | artifact upload line 74; release draft job at `.github/workflows/release.yml:80-125 @ 869ce22`; no signing/notarization match found |

Only paths and decisive line numbers are recorded; workflow environment values are not reproduced.

### (l) Everything else

Remaining tracked non-`.rs/.toml/.md/.sql` files grouped by extension (includes assets itemized above):

| Repository | Extension counts |
| --- | --- |
| v1 | `.astro` 1; `.editorconfig` 1; `.gitattributes` 1; `.gitignore` 1; `.icns` 1; `.json` 6; `.lock` 1; `.mjs` 1; `.plist` 1; `.png` 7; `.py` 2; `.sh` 9; `.svg` 252; `.ttf` 1; `.txt` 2; extensionless 1; `Dockerfile` 1 |
| player | `.editorconfig` 1; `.gitattributes` 1; `.gitignore` 1; `.json` 1; `.lock` 1; `.png` 1; `.py` 5; `.svg` 277; `.ttf` 2; `.txt` 2; `.yml` 6; extensionless 2 |

## 5. Citation index

Each resolver reads the tracked object at the cited commit. The result is the first cited line, shortened to 72 characters and redacted before recording; range endpoints were both checked.

| Citation | Resolver | Result (redacted excerpt) |
| --- | --- | --- |
| `.github/workflows/ci.yml:2-7 @ 869ce22` | `git show 869ce22:.github/workflows/ci.yml \| sed -n '2,7p'` | on: / pull_request: |
| `.github/workflows/dependency-review.yml:1-6 @ 869ce22` | `git show 869ce22:.github/workflows/dependency-review.yml \| sed -n '1,6p'` | name: Dependency review / review: |
| `.github/workflows/release.yml:122-125 @ 869ce22` | `git show 869ce22:.github/workflows/release.yml \| sed -n '122,125p'` | command = ['gh', 'release', 'create', tag, '--repo', os.environ['GH_REPO / command.append('--prerelease') |
| `.github/workflows/release.yml:2-7 @ 869ce22` | `git show 869ce22:.github/workflows/release.yml \| sed -n '2,7p'` | on: / tag: |
| `.github/workflows/release.yml:74 @ 869ce22` | `git show 869ce22:.github/workflows/release.yml \| sed -n '74p'` | <redacted:identity\|endpoint\|credential> |
| `.github/workflows/release.yml:80-125 @ 869ce22` | `git show 869ce22:.github/workflows/release.yml \| sed -n '80,125p'` | draft: / command.append('--prerelease') |
| `Cargo.toml:23 @ 869ce22` | `git show 869ce22:Cargo.toml \| sed -n '23p'` | [profile.release] |
| `Cargo.toml:25 @ 7469f2a` | `git show 7469f2a:Cargo.toml \| sed -n '25p'` | [profile.release] |
| `crates/desktop/Cargo.toml:22 @ 869ce22` | `git show 869ce22:crates/desktop/Cargo.toml \| sed -n '22p'` | [target.'cfg(target_os = "macos")'.dependencies] |
| `crates/desktop/Cargo.toml:26 @ 7469f2a` | `git show 7469f2a:crates/desktop/Cargo.toml \| sed -n '26p'` | [target.'cfg(target_os = "macos")'.dependencies] |
| `crates/desktop/assets/README.md:3-37 @ 7469f2a` | `git show 7469f2a:crates/desktop/assets/README.md \| sed -n '3,37p'` | 'setup-cinema.png' is bundled into the Rust binary; setup requires no im / <redacted:identity\|endpoint\|credential> |
| `crates/desktop/assets/README.md:32-34 @ 7469f2a` | `git show 7469f2a:crates/desktop/assets/README.md \| sed -n '32,34p'` | Regenerate with './scripts/build-icon.sh' (requires 'rsvg-convert', macO / those builds do not require an SVG renderer. |
| `crates/desktop/assets/manifest.json:10-18 @ 869ce22` | `git show 869ce22:crates/desktop/assets/manifest.json \| sed -n '10,18p'` | "icons": { / "notice_revision": "b8718fbc0a8654f6065cff8b3166ee3b99cd89ca" |
| `crates/desktop/assets/manifest.json:2-9 @ 869ce22` | `git show 869ce22:crates/desktop/assets/manifest.json \| sed -n '2,9p'` | "font": { / }, |
| `crates/desktop/assets/manifest.json:275-277 @ 869ce22` | `git show 869ce22:crates/desktop/assets/manifest.json \| sed -n '275,277p'` | "fonts/AsapSharp-Regular.ttf": "210c619cd84c6a257b20847c69eb470c7fd3116f / "fonts/OFL.txt": "3f0a89775c7933112b55fc351dc864683f09e9ac4afe56d36f81bf |
| `crates/desktop/src/app.rs:20 @ 869ce22` | `git show 869ce22:crates/desktop/src/app.rs \| sed -n '20p'` | enum LibraryState { |
| `crates/desktop/src/app/multiview.rs:70 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/app/multiview.rs \| sed -n '70p'` | pub(super) fn open_multiview(&mut self, ctx: &egui::Context) { |
| `crates/desktop/src/app/palette.rs:31 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/app/palette.rs \| sed -n '31p'` | pub(super) fn open_palette(&mut self) { |
| `crates/desktop/src/app/pip.rs:5 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/app/pip.rs \| sed -n '5p'` | pub(super) fn toggle_pip(&mut self, ctx: &egui::Context) { |
| `crates/desktop/src/app/settings.rs:112 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/app/settings.rs \| sed -n '112p'` | pub(super) fn settings(&mut self, ui: &mut egui::Ui, ctx: &egui::Context |
| `crates/desktop/src/app/shell.rs:4 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/app/shell.rs \| sed -n '4p'` | pub(super) fn sidebar(&mut self, ctx: &egui::Context) { |
| `crates/desktop/src/app/watch.rs:4 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/app/watch.rs \| sed -n '4p'` | pub(super) fn video(&mut self, ui: &mut egui::Ui, ctx: &egui::Context) { |
| `crates/desktop/src/assets.rs:188-193 @ 869ce22` | `git show 869ce22:crates/desktop/src/assets.rs \| sed -n '188,193p'` | "Asap Sharp".into(), / egui::FontData::from_static(include_bytes!("../assets/fonts/AsapSharp-Se |
| `crates/desktop/src/assets.rs:62-65 @ 869ce22` | `git show 869ce22:crates/desktop/src/assets.rs \| sed -n '62,65p'` | match self { / include_bytes!("../assets/icons/keyboard-command.svg"), |
| `crates/desktop/src/notifications.rs:145 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/notifications.rs \| sed -n '145p'` | pub fn schedule(reminder: &Reminder) -> Result<(), String> { |
| `crates/desktop/src/theme.rs:165-170 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/theme.rs \| sed -n '165,170p'` | let mut fonts = egui::FontDefinitions::default(); / fonts |
| `crates/desktop/src/theme.rs:78 @ 7469f2a` | `git show 7469f2a:crates/desktop/src/theme.rs \| sed -n '78p'` | pub enum Scheme { |
| `crates/desktop/tests/shell.rs:11 @ 869ce22` | `git show 869ce22:crates/desktop/tests/shell.rs \| sed -n '11p'` | fn preference_serialization_contains_no_connection_or_route_state() { |
| `crates/domain/src/lib.rs:3 @ 869ce22` | `git show 869ce22:crates/domain/src/lib.rs \| sed -n '3p'` | mod connection; |
| `crates/domain/tests/live.rs:4 @ 869ce22` | `git show 869ce22:crates/domain/tests/live.rs \| sed -n '4p'` | fn given_provider_metadata_when_recognizing_countries_then_unknown_data_ |
| `crates/domain/tests/shell.rs:4 @ 869ce22` | `git show 869ce22:crates/domain/tests/shell.rs \| sed -n '4p'` | fn empty_catalogue_opens_setup_and_cannot_navigate_into_a_fake_library() |
| `crates/downloads/Cargo.toml:15 @ 7469f2a` | `git show 7469f2a:crates/downloads/Cargo.toml \| sed -n '15p'` | [target.'cfg(unix)'.dependencies] |
| `crates/downloads/src/transfer.rs:10 @ 7469f2a` | `git show 7469f2a:crates/downloads/src/transfer.rs \| sed -n '10p'` | fn cancelled(id: u64, items: &Arc<Mutex<Vec<Download>>>, stop: &AtomicBo |
| `crates/playback/src/controller.rs:9 @ 869ce22` | `git show 869ce22:crates/playback/src/controller.rs \| sed -n '9p'` | pub enum Command { |
| `crates/playback/src/lib.rs:257 @ 7469f2a` | `git show 7469f2a:crates/playback/src/lib.rs \| sed -n '257p'` | pub struct Player { |
| `crates/playback/src/lib.rs:7 @ 869ce22` | `git show 869ce22:crates/playback/src/lib.rs \| sed -n '7p'` | mod address; |
| `crates/playback/src/mpv/tests.rs:4 @ 869ce22` | `git show 869ce22:crates/playback/src/mpv/tests.rs \| sed -n '4p'` | <redacted:identity\|endpoint\|credential> |
| `crates/playback/tests/address.rs:5 @ 869ce22` | `git show 869ce22:crates/playback/tests/address.rs \| sed -n '5p'` | <redacted:identity\|endpoint\|credential> |
| `crates/playback/tests/controller.rs:5 @ 869ce22` | `git show 869ce22:crates/playback/tests/controller.rs \| sed -n '5p'` | <redacted:identity\|endpoint\|credential> |
| `crates/providers/Cargo.toml:23 @ 869ce22` | `git show 869ce22:crates/providers/Cargo.toml \| sed -n '23p'` | [target.'cfg(unix)'.dependencies] |
| `crates/providers/src/lib.rs:12 @ 869ce22` | `git show 869ce22:crates/providers/src/lib.rs \| sed -n '12p'` | pub enum ProviderError { |
| `crates/providers/src/m3u.rs:121 @ 7469f2a` | `git show 7469f2a:crates/providers/src/m3u.rs \| sed -n '121p'` | pub fn new(reader: R) -> Self { |
| `crates/providers/src/m3u.rs:5 @ 869ce22` | `git show 869ce22:crates/providers/src/m3u.rs \| sed -n '5p'` | pub fn attributes(input: &str) -> Vec<(String, String)> { |
| `crates/providers/src/subtitles.rs:62 @ 7469f2a` | `git show 7469f2a:crates/providers/src/subtitles.rs \| sed -n '62p'` | pub fn search( |
| `crates/providers/src/xmltv.rs:33 @ 7469f2a` | `git show 7469f2a:crates/providers/src/xmltv.rs \| sed -n '33p'` | pub fn new(reader: R) -> Self { |
| `crates/providers/src/xtream.rs:92 @ 7469f2a` | `git show 7469f2a:crates/providers/src/xtream.rs \| sed -n '92p'` | pub fn import( |
| `crates/providers/tests/imports.rs:11 @ 869ce22` | `git show 869ce22:crates/providers/tests/imports.rs \| sed -n '11p'` | struct FakeVault { |
| `crates/providers/tests/network.rs:7 @ 869ce22` | `git show 869ce22:crates/providers/tests/network.rs \| sed -n '7p'` | fn server(responses: Vec<(&'static str, String)>) -> (String, std::threa |
| `crates/providers/tests/parsers.rs:5 @ 869ce22` | `git show 869ce22:crates/providers/tests/parsers.rs \| sed -n '5p'` | fn m3u_preserves_order_quotes_groups_logo_and_kind() { |
| `crates/store/src/discovery.rs:5 @ 7469f2a` | `git show 7469f2a:crates/store/src/discovery.rs \| sed -n '5p'` | pub fn popular_entries( |
| `crates/store/src/lib.rs:18 @ 869ce22` | `git show 869ce22:crates/store/src/lib.rs \| sed -n '18p'` | pub const SCHEMA_VERSION: i64 = 4; |
| `crates/store/src/lib.rs:28 @ 7469f2a` | `git show 7469f2a:crates/store/src/lib.rs \| sed -n '28p'` | const SCHEMA_VERSION: i64 = 10; |
| `crates/store/src/lib.rs:30 @ 7469f2a` | `git show 7469f2a:crates/store/src/lib.rs \| sed -n '30p'` | pub struct Store { |
| `crates/store/src/live.rs:5 @ 7469f2a` | `git show 7469f2a:crates/store/src/live.rs \| sed -n '5p'` | pub(super) fn sync(tx: &Transaction<'_>) -> Result<()> { |
| `crates/store/src/live.rs:8 @ 869ce22` | `git show 869ce22:crates/store/src/live.rs \| sed -n '8p'` | const PROVIDER: &str = "s.provider_order,e.provider_order,e.id"; |
| `crates/store/src/live_categories.rs:113 @ 7469f2a` | `git show 7469f2a:crates/store/src/live_categories.rs \| sed -n '113p'` | pub fn channel_categories( |
| `crates/store/src/space_state.rs:5 @ 7469f2a` | `git show 7469f2a:crates/store/src/space_state.rs \| sed -n '5p'` | pub fn open_for_space(path: &Path, space: &str) -> Result<Self> { |
| `crates/store/src/spaces.rs:12 @ 7469f2a` | `git show 7469f2a:crates/store/src/spaces.rs \| sed -n '12p'` | pub struct Space { |
| `crates/store/src/subtitle_accounts.rs:64 @ 7469f2a` | `git show 7469f2a:crates/store/src/subtitle_accounts.rs \| sed -n '64p'` | pub fn save_subtitle_account( |
| `crates/store/tests/catalogue.rs:5 @ 869ce22` | `git show 869ce22:crates/store/tests/catalogue.rs \| sed -n '5p'` | fn playlist() -> Playlist { |
| `crates/store/tests/live.rs:5 @ 869ce22` | `git show 869ce22:crates/store/tests/live.rs \| sed -n '5p'` | fn playlist(name: &str) -> Playlist { |
| `crates/store/tests/references.rs:4 @ 869ce22` | `git show 869ce22:crates/store/tests/references.rs \| sed -n '4p'` | fn pending_vault_cleanup_is_durable_and_never_removes_committed_referenc |
| `crates/vault/Cargo.toml:18 @ 869ce22` | `git show 869ce22:crates/vault/Cargo.toml \| sed -n '18p'` | [target.'cfg(target_os = "macos")'.dependencies] |
| `crates/vault/Cargo.toml:21 @ 869ce22` | `git show 869ce22:crates/vault/Cargo.toml \| sed -n '21p'` | [target.'cfg(target_os = "windows")'.dependencies] |
| `crates/vault/src/lib.rs:14 @ 869ce22` | `git show 869ce22:crates/vault/src/lib.rs \| sed -n '14p'` | fn key(&self, id: &str, create: bool) -> Result<[u8; 32], VaultError>; |
| `crates/vault/tests/encryption.rs:5 @ 869ce22` | `git show 869ce22:crates/vault/tests/encryption.rs \| sed -n '5p'` | struct Keys(Mutex<HashMap<String, [u8; 32]>>); |
| `docs/src/pages/audit.md:10 @ 7469f2a` | `git show 7469f2a:docs/src/pages/audit.md \| sed -n '10p'` | Reviewed the current local 'dist/StreamPlay.app' on macOS and the Rust w |
| `scripts/build-macos.sh:11-16 @ 7469f2a` | `git show 7469f2a:scripts/build-macos.sh \| sed -n '11,16p'` | cargo build --locked --release -p streamplay-desktop / cp crates/desktop/assets/icon/StreamPlay.icns "$bundle/Contents/Resource |
| `scripts/build-macos.sh:42-63 @ 7469f2a` | `git show 7469f2a:scripts/build-macos.sh \| sed -n '42,63p'` | <redacted:identity\|endpoint\|credential> / <redacted:identity\|endpoint\|credential> |
| `scripts/build-macos.sh:42-66 @ 7469f2a` | `git show 7469f2a:scripts/build-macos.sh \| sed -n '42,66p'` | <redacted:identity\|endpoint\|credential> / ditto -c -k --keepParent "$bundle" "dist/StreamPlay-${version}.zip" |
| `scripts/build-windows.sh:32-54 @ 7469f2a` | `git show 7469f2a:scripts/build-windows.sh \| sed -n '32,54p'` | run cargo build --release --target x86_64-pc-windows-gnu -p streamplay-d / run cp /target/x86_64-pc-windows-gnu/release/streamplay.exe "$OUT/Stream |

## 6. Green evidence

- G1: `python3 /tmp/job0017_gates.py` checked 71 unique citations; 0 missing paths or empty/out-of-range endpoints. Resolver commands and redacted results are in §5.
- G2: `rg -n 'README\.md:3 @ 7469f2a' docs/backlog docs/adr` — 0 hits (exit 1); `rg -n 'shell\.rs:4' docs/adr/ADR-011-proicons.md` — 0 hits (exit 1).
- G3: 21 OQ headings; 0 duplicates; 0 OQs without Status; 0 dangling OQ references. Matrix tables: 36 rows, 0 missing or duplicate LA IDs per row, 0 rows with other than one verdict. No owner-only item is `resolved`.
- G4: `/tmp/job0017_fixture.txt` caught 10/10 planted patterns and was removed; scan over added documentation lines and the full ledger found 0 hits.
- G5: `git diff --name-only` lists 16 modified docs paths and the untracked ledger adds one Markdown path under `docs/`; 0 outside paths and 0 binary rows. `main...HEAD` is empty until the factory commits the worktree.
- G6: source HEAD hashes and porcelain counts are identical before/after: v1 `7469f2a60640850fa5fd3c710dad9124594a9365` / 6; player `869ce22b96569fb3c9f5da616fbcd042966b3b6c` / 0.
- G7: no cargo command was run.

## 7. Remaining unknowns

| Unknown | Open question |
| --- | --- |
| Confirm archive correspondence and redistribution terms for owner-designated ProIcons source | OQ-020 |
| Provenance of two short non-reserved host literals in one network test (LA-019) | OQ-021 |
| Owner choice of v2 native codec and release policy after the recorded Cargo/script inventory | OQ-004, OQ-010 |
