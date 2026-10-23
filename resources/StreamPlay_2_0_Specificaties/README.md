# StreamPlay 2.0 — Factory-ready product specificaties

**Doel:** complete Rust-herbouw vanaf scratch, met oude code uitsluitend als referentie. **Scope:** 33 UX-schermen, BDD-first, 3 standaardthema's, Asap Sharp, 544 aangeleverde ProIcons, geïntegreerde macOS-window chrome, Configuratiescherm en Spaces.

## Documentkaart
- [`guides/BUILD_EN_STYLE_GUIDE.md`](guides/BUILD_EN_STYLE_GUIDE.md) — productvisie, volledige UI/designsystem, buildconventies en definition of done.
- [`guides/TECHNISCHE_ARCHITECTUUR.md`](guides/TECHNISCHE_ARCHITECTUUR.md) — Rust-architectuur, migratie, player, data, security, performance en open technische beslissingen.
- [`factory/SOFTWARE_FACTORY_INTEGRATIE.md`](factory/SOFTWARE_FACTORY_INTEGRATIE.md) — Claude Code, jobs, worktrees, agentrollen, artefactcontracten en gates.
- [`factory/INITIATIVES_EN_JOB_BACKLOG.md`](factory/INITIATIVES_EN_JOB_BACKLOG.md) — afhankelijke initiatieven/milestones/jobs met IDs en voorbeelden.
- [`factory/CLAUDE_PROJECT_TEMPLATE.md`](factory/CLAUDE_PROJECT_TEMPLATE.md) — voorstel voor projectgebonden CLAUDE.md.
- [`bdd/BDD_STRATEGIE.md`](bdd/BDD_STRATEGIE.md) — BDD-toolingbeslisboom, scenario's, testlagen en CI.
- [`guides/DATA_EN_CONTENT_MODELLEN.md`](guides/DATA_EN_CONTENT_MODELLEN.md) — invarianten van Spaces, playlists, categorieën, bronnen en metadata.
- [`guides/BESLISSINGEN_EN_RISICOS.md`](guides/BESLISSINGEN_EN_RISICOS.md) — expliciete goedkeuringspunten/ADRs.
- `schermen/01_*.md` t/m `schermen/33_*.md` — uitgebreide individuele schermspecificaties met Gherkin.

## Relatie met ontwerpen
Beide ZIP's naast elkaar bewaren: `StreamPlay_2_0_alle_33_designs.zip` bevat de schermmockups; deze ZIP bevat **uitsluitend Markdown**, geen gedupliceerde beelden. De precieze bestandsnaam van elk scherm staat bovenaan de bijbehorende MD. Mockups zijn conceptmateriaal en zijn niet pixel-perfect of betrouwbare datavoorbeelden.

## Uitvoering
1. Inventariseer legacy-repository read-only; laat eerst capabilities en technische beperkingen vaststellen.
2. Laat een initiative-plan inclusief afhankelijkheden en ADR's genereren; **menselijke goedkeuring vóór bouwen**.
3. Bouw foundation en vertical slice (Space → playlistimport → livekanaal → player → EPG) onder BDD-gates.
4. Voer overige schermmodules in onafhankelijke jobs met gescheiden worktrees uit.
5. Pas review, rework en PR/CI-gates toe; behoud domein- en visuele regressietests.

## Status en beperkingen
- Ontwerpbrief op basis van conversatie/screenmockups; de bestaande Rust-repo is niet aangeleverd of geanalyseerd.
- De exacte GUI-frameworkkeuze, player/DRM-stack, offline-capabilities en databasekeuze zijn bewust open.
- De gewenste Asap Sharp fontbestanden zitten niet in deze ZIP; licentie en daadwerkelijke fonts moeten bij setup worden gecontroleerd.
- ProIcons zijn aangeleverd als afzonderlijke iconen-ZIP maar worden niet herverdeeld in deze specificatie-ZIP.
- Algemene schermcriteria zijn generieke kwaliteitscontracten; per scherm aangeleverde domeinregels zijn aanvullend verplicht.
