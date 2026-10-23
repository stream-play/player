# SP-26 — Appearance

> **Status:** designbrief + implementatiespecificatie, nog niet door product owner goedgekeurd.  
> **Designreferentie:** `26_Appearance.jpg` uit `StreamPlay_2_0_alle_33_designs.zip` (conceptuele inspiratie; geen pixel-perfect contract).  
> **Prioriteit:** P0.  
> **Module:** Settings.

## 1. Doel en gebruikerswaarde
Drie officiële thema’s beheren en voorkeur per Space tonen.

**Primair gebruikersdoel:** de gebruiker kan de kernworkflow van dit scherm voltooien zonder externe context of onduidelijke knoppen. Alle voorgestelde functionaliteit die een provider of player-capability vereist, moet op basis van daadwerkelijke capability-data worden getoond of verborgen.

## 2. Schermcompositie en visuele opbouw
Grote interactieve themakaarten Cinematic Dark, Midnight Navy, Studio Light; Accent/preview.

- **App-shell:** thematische macOS-titelbalk met native vensterknoppen, opzij een consistente hoofdsidebar en globale zoek-/Space-controls voor zover passend in fullscreen playback. De linkernavigatie kan compacter worden bij minder ruimte.
- **Hiërarchie:** één duidelijke paginatitel, één primaire actie op het focusgebied, secundaire acties als bescheiden buttons, contextacties bij de betrokken kaart. Geen overbodige randen rond louter decoratieve content.
- **Cinematic Dark:** sterke inhoudsafbeeldingen met donkere scrim en tekstveilige gradiënt, card radius via tokens, subtiele grenslijnen, focusring zichtbaar; layout moet ook werken in Midnight Navy en Studio Light.
- **Dichtheid:** desktop-typografie met Asap Sharp en echte ProIcons. Voorkom tekst van minder dan 12px in gewone UI, uitzonderingen voor ondergeschikte technische labels uitsluitend na contrastcheck.
- **Responsiviteit:** boven 1440px royale compositie; 1024–1439px compacte rails en cards; onder 1024px collapsible zijpaneel en geprioriteerde primaire inhoud. Geen horizontaal scrollende formulieren.
- **A11y:** headings hiërarchisch; alt-tekst bij betekenisvolle afbeeldingen; keyboard focus en logische tabvolgorde; niet alleen kleur voor actieve status.

## 3. Gegevens en domeincontract
Te realiseren viewmodel-inputs (indicatieve namen, **nog geen definitief Rust-API-contract**): `globalTheme, systemPreference, spaceThemeOverride, appearancePreview`.

Voor ieder gegevenselement: ID, herkomst, laadstatus, errorstatus en capability waar relevant. Houd domeinobjecten gescheiden van opmaak. UI toont echte data of een expliciete placeholder; nooit gefingeerde kanalen, programma's of kwaliteitsbadges in productiemodus.

**Domeinspecifieke regels:** Tokens scheiden structuur van kleur; Custom thema voorbereid maar niet in v1 editor.

## 4. Interacties en gedrag
1. Thema kiezen. Definieer disabled-, loading-, success- en error-feedback; ondersteun toetsenbord en screenreader indien toepasselijk.
2. Space override. Definieer disabled-, loading-, success- en error-feedback; ondersteun toetsenbord en screenreader indien toepasselijk.
3. standaard herstellen. Definieer disabled-, loading-, success- en error-feedback; ondersteun toetsenbord en screenreader indien toepasselijk.
4. preview toggelen. Definieer disabled-, loading-, success- en error-feedback; ondersteun toetsenbord en screenreader indien toepasselijk.

**Navigatiecontract:** terug navigeert naar de vorige inhoudelijke context en herstelt relevante filters, focus of tijdpositie. Deep links / routes gebruiken stabiele IDs, niet alleen titels. Wijzigingen en playerstatus worden door de relevante service beheerd en niet in een visuele component geïmproviseerd.

## 5. Componenten en schermtoestanden
- **Laden:** skeletons die dezelfde ruimte reserveren als uiteindelijke afbeeldingen/rijen; geen verschuivende layout; laadindicatie op acties boven 300ms.
- **Gevuld:** basislay-out als hierboven; badges alleen bij bewezen inhoud of actieve toestand.
- **Leeg:** Ontbrekende custom configuratie: themadefault behouden.
- **Fout:** lokale, begrijpelijke beschrijving met Retry en zo mogelijk fallback; scherm en andere content blijven bruikbaar.
- **Offline:** maak onderscheid tussen lokale content, gecachte metadata en netwerkafhankelijke acties.
- **Partial data:** ontbrekende poster of EPG onderbreekt browse/play niet.
- **Toegankelijk:** Enter/Space voor acties, Escape voor modals, focus na sluiten terug naar opener, voldoende touch/click targets (min. ~40px waar haalbaar).
- **Prestatie:** virtualisatie/paginering waar van toepassing; lazy afbeeldingen, cancel van verouderde requests, geen N+1-datatoegang.

## 6. BDD — Gherkin-acceptatiecriteria

```gherkin
Feature: SP-26 Appearance
  Als StreamPlay-gebruiker
  wil ik drie officiële thema’s beheren en voorkeur per Space tonen
  zodat ik zonder verwarring mijn mediabibliotheek kan gebruiken.

  Background:
    Given de applicatie is gestart met een geldige lokale configuratie
    And het thema "Cinematic Dark" is geselecteerd

  Scenario: Scherm tonen met geldige data
    Given de benodigde gegevens voor scherm SP-26 beschikbaar zijn
    When ik scherm "Appearance" open
    Then zie ik de primaire paginatitel en kerninhoud
    And worden de gegevens zonder verzonnen placeholders getoond
    And voldoet de bediening aan het gedeelde navigatiepatroon

  Scenario: Lege data wordt uitgelegd
    Given de inhoudsdataset voor scherm SP-26 leeg is
    When ik scherm "Appearance" open
    Then zie ik een contextuele lege-toestand
    And zie ik een zinvolle herstelactie of toelichting

  Scenario: Een laadfout tast de rest van de app niet aan
    Given een relevante datasource voor dit scherm faalt
    When ik de inhoud probeer te laden
    Then toont StreamPlay een lokale foutmelding
    And kan ik de actie opnieuw proberen
    And blijft de app-navigatie beschikbaar

  Scenario: Bedienbaarheid zonder muis
    Given dit scherm focus heeft
    When ik de acties met het toetsenbord doorloop
    Then is de focus zichtbaar
    And kan ik de hoofdactie zonder muis bedienen
```

### Aanvullende scenarios om te automatiseren
- **SP-26-INT-01:** Thema kiezen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
- **SP-26-INT-02:** Space override: succesvolle actie, failure response, loading en undo/confirm waar relevant.
- **SP-26-INT-03:** standaard herstellen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
- **SP-26-INT-04:** preview toggelen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
- **SP-26-VIS-01:** vergelijking met designreferentie op vaste viewport, na toegestane verschillen in dynamische media en tekst.
- **SP-26-A11Y-01:** keyboard-only, WCAG 2.2 AA contrastcontrole, screenreader labels en reduce-motion.

## 7. Randgevallen en risico's
Native macOS traffic lights en contrast AA.

Ook testen: input met accenten/RTL, lege en extreem lange titels, beeldmateriaal met variërende verhoudingen, trage schijven/netwerk, duplicate IDs en terug-/heropenen zonder verlies van onopgeslagen data.

## 8. Aanpak voor builder en reviewers
1. Maak eerst domeinscenario's en executable Gherkin/step definitions; laat ze aanvankelijk falen (**red**).
2. Implementeer service/viewmodel met fake adapters; voeg integratietest tegen echte adapter toe (**green**).
3. Bouw UI uit gedeelde componenten, voeg keyboard tests, screenshot tests en foutenpaden toe (**refactor**).
4. Voer onafhankelijke Rust, security, UI/UX en accessibility reviews uit.
5. Scherm gereed wanneer alle acceptatiecriteria slagen, gekoppelde screenshots reviewbaar zijn en geen P0/P1-reviewissue openstaat.

## 9. Afhankelijkheden / open vragen
- Referentie: `../guides/BUILD_EN_STYLE_GUIDE.md`, `../guides/TECHNISCHE_ARCHITECTUUR.md`, `../bdd/BDD_STRATEGIE.md`.
- Vereist: app-shell, thema-tokens, Asap Sharp, ProIcons en fake-data contracten.
- Controleer tegen bestaande Rust-code: daadwerkelijk ondersteunde providers, speler-capabilities, datamodellen, track- en licentiegedrag.
- Dit document is functioneel leidend na review; het gegenereerde mockup is sfeer- en layoutreferentie, géén bewijs dat alle voorgestelde functies al bestaan.
