# BDD-strategie — specification by example als leidraad

## Workflow
**Discovery → Three Amigos → Gherkin → Red → Green → Refactor → Review → Approval → Delivery.** Product owner, builder en onafhankelijke test/UX reviewer scherpen voorbeelden vóór code aan. Iedere acceptance requirement verwijst naar een scenario-ID. Scenario's beschrijven observeerbaar gedrag, geen implementatiedetails.

## Tooling
Toolkeuze afhankelijk van GUI-framework/ADR: voor Rust-domain Gherkin via `cucumber`-ecosysteem of vergelijkbare runner na onderhoudscheck; GUI-E2E via frameworkgeschikte driver, Mac-native UI automation waar noodzakelijk. Gebruik pure unit/property tests voor invarianten en fixtures, niet alles forceren in Gherkin.

## Projectstructuur
```text
features/
  space_management.feature
  playlist_import.feature
  categories.feature
  epg_mapping.feature
  live_player.feature
  movie_details.feature
  appearance.feature
  screens/sp01_home.feature ... sp33_rules.feature
crates/test_support/src/{fixtures,clock,ports}.rs
```

## Voorbeeld: playlists en categorieën
```gherkin
Feature: Gebruikerscategorieën overleven providerverversing
  Background:
    Given er is een Space "Sports"
    And playlist "Provider A" bevat kanaal "ESPN" in categorie "NL SPORT"

  Scenario: Lokale categorienaam blijft behouden na sync
    Given ik map "NL SPORT" naar lokale categorie "Sport"
    And ik geef lokale categorie "Sport" de beschrijving "Alle sportzenders"
    When playlist "Provider A" succesvol wordt vernieuwd
    Then blijft categorie "Sport" bestaan met dezelfde beschrijving
    And staat kanaal "ESPN" nog in categorie "Sport"
    And is de ruwe provider-categorie "NL SPORT" niet aangepast

  Scenario: Een fout tijdens sync verandert het zichtbare resultaat niet
    Given een eerdere sync succesvol was
    When een verversing een ongeldige playlist oplevert
    Then wordt geen gedeeltelijke dataset gecommit
    And kan ik de oude kanalen blijven gebruiken
    And toont de applicatie een herstelbare fout
```

## Voorbeeld: EPG en player
```gherkin
Feature: Geïntegreerde EPG onderbreekt live-tv niet
  Scenario: Gids openen tijdens afspelen
    Given ik kijk live naar kanaal "Sport Live"
    And de stream speelt daadwerkelijk af
    When ik de geïntegreerde gids open
    Then blijft dezelfde player-sessie actief
    And worden huidige en volgende programma's getoond als EPG-data bestaat
    When ik de gids sluit
    Then blijft de player-sessie actief

  Scenario: EPG is niet beschikbaar
    Given een kanaal geen programmainformatie heeft
    When ik de gids open
    Then zie ik "Geen programmainformatie"
    And kan ik het kanaal nog steeds bekijken
```

## Scenario-categorieën per feature
1. Happy path, 2. Empty data, 3. Partial error/offline, 4. Unauthorized/unavailable capability, 5. Boundary data, 6. Keyboard/a11y, 7. Restoration/persistence, 8. Multispace isolation, 9. Concurrency/undo where relevant, 10. Migration compatibility.

## Testpiramide
Domeinunit + property-based tests (invarianten), application contract tests met fake ports, adapter integration met lokale fixture servers, UI-E2E op echte macOS test runner, screenshot diff (3 thema's), video smoke tests met rechtenvrije lokaal beheerde streamfixtures, performance regression benchmarks.

## CI policies
- Iedere job heeft minimaal één nieuwe of aangepaste `.feature` met step definitions als acceptatiegedrag wijzigt.
- Red bewijs vóór implementatie opnemen in job artefact (niet per se als committed failing tests in main branch).
- Groen: alle betrokken Gherkin, unit/integration, fmt/clippy/audit en visual checks.
- Geen flaky tests herhalen tot groen zonder root-cause rapport; quarantined test = zichtbaar blokkerend risico.
- Traceability report: `SP-XX` → scenario → files → commit → PR → review → approval.

## Definition of Done
Behaviors herkenbaar en meetbaar, testdata deterministisch, scenario's geautomatiseerd, failure recovery verifieerbaar, a11y gecontroleerd, reviews onafhankelijk, geen open kritieke P0/P1 defects, eigenaar heeft ADR's en majeure UX veranderingen goedgekeurd.
