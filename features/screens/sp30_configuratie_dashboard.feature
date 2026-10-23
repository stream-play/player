Feature: SP-30 Configuratie-dashboard
  Als StreamPlay-gebruiker
  wil ik centraal cockpit voor informatiearchitectuur en contentorganisatie
  zodat ik zonder verwarring mijn mediabibliotheek kan gebruiken.

  Background:
    Given de applicatie is gestart met een geldige lokale configuratie
    And het thema "Cinematic Dark" is geselecteerd

  @SP-30 @SP-30-GH-01 @pending
  Scenario: Scherm tonen met geldige data
    Given de benodigde gegevens voor scherm SP-30 beschikbaar zijn
    When ik scherm "Configuratie-dashboard" open
    Then zie ik de primaire paginatitel en kerninhoud
    And worden de gegevens zonder verzonnen placeholders getoond
    And voldoet de bediening aan het gedeelde navigatiepatroon

  @SP-30 @SP-30-GH-02 @pending
  Scenario: Lege data wordt uitgelegd
    Given de inhoudsdataset voor scherm SP-30 leeg is
    When ik scherm "Configuratie-dashboard" open
    Then zie ik een contextuele lege-toestand
    And zie ik een zinvolle herstelactie of toelichting

  @SP-30 @SP-30-GH-03 @pending
  Scenario: Een laadfout tast de rest van de app niet aan
    Given een relevante datasource voor dit scherm faalt
    When ik de inhoud probeer te laden
    Then toont StreamPlay een lokale foutmelding
    And kan ik de actie opnieuw proberen
    And blijft de app-navigatie beschikbaar

  @SP-30 @SP-30-GH-04 @pending
  Scenario: Bedienbaarheid zonder muis
    Given dit scherm focus heeft
    When ik de acties met het toetsenbord doorloop
    Then is de focus zichtbaar
    And kan ik de hoofdactie zonder muis bedienen

  @SP-30 @SP-30-INT-01 @pending
  Scenario Outline: SP-30-INT-01: Module openen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-30-INT-01 nog uit te werken

    Examples:
      | id |
      | SP-30-INT-01 |

  @SP-30 @SP-30-INT-02 @pending
  Scenario Outline: SP-30-INT-02: zoeken in configuratie: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-30-INT-02 nog uit te werken

    Examples:
      | id |
      | SP-30-INT-02 |

  @SP-30 @SP-30-INT-03 @pending
  Scenario Outline: SP-30-INT-03: recente veranderingen bekijken: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-30-INT-03 nog uit te werken

    Examples:
      | id |
      | SP-30-INT-03 |

  @SP-30 @SP-30-VIS-01 @pending
  Scenario Outline: SP-30-VIS-01: vergelijking met designreferentie op vaste viewport, na toegestane verschillen in dynamische media en tekst.
    Given TODO: SP-30-VIS-01 nog uit te werken

    Examples:
      | id |
      | SP-30-VIS-01 |

  @SP-30 @SP-30-A11Y-01 @pending
  Scenario Outline: SP-30-A11Y-01: keyboard-only, WCAG 2.2 AA contrastcontrole, screenreader labels en reduce-motion.
    Given TODO: SP-30-A11Y-01 nog uit te werken

    Examples:
      | id |
      | SP-30-A11Y-01 |
