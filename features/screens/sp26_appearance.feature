Feature: SP-26 Appearance
  Als StreamPlay-gebruiker
  wil ik drie officiële thema’s beheren en voorkeur per Space tonen
  zodat ik zonder verwarring mijn mediabibliotheek kan gebruiken.

  Background:
    Given de applicatie is gestart met een geldige lokale configuratie
    And het thema "Cinematic Dark" is geselecteerd

  @SP-26 @SP-26-GH-01 @pending
  Scenario: Scherm tonen met geldige data
    Given de benodigde gegevens voor scherm SP-26 beschikbaar zijn
    When ik scherm "Appearance" open
    Then zie ik de primaire paginatitel en kerninhoud
    And worden de gegevens zonder verzonnen placeholders getoond
    And voldoet de bediening aan het gedeelde navigatiepatroon

  @SP-26 @SP-26-GH-02 @pending
  Scenario: Lege data wordt uitgelegd
    Given de inhoudsdataset voor scherm SP-26 leeg is
    When ik scherm "Appearance" open
    Then zie ik een contextuele lege-toestand
    And zie ik een zinvolle herstelactie of toelichting

  @SP-26 @SP-26-GH-03 @pending
  Scenario: Een laadfout tast de rest van de app niet aan
    Given een relevante datasource voor dit scherm faalt
    When ik de inhoud probeer te laden
    Then toont StreamPlay een lokale foutmelding
    And kan ik de actie opnieuw proberen
    And blijft de app-navigatie beschikbaar

  @SP-26 @SP-26-GH-04 @pending
  Scenario: Bedienbaarheid zonder muis
    Given dit scherm focus heeft
    When ik de acties met het toetsenbord doorloop
    Then is de focus zichtbaar
    And kan ik de hoofdactie zonder muis bedienen

  @SP-26 @SP-26-INT-01 @pending
  Scenario Outline: SP-26-INT-01: Thema kiezen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-26-INT-01 nog uit te werken

    Examples:
      | id |
      | SP-26-INT-01 |

  @SP-26 @SP-26-INT-02 @pending
  Scenario Outline: SP-26-INT-02: Space override: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-26-INT-02 nog uit te werken

    Examples:
      | id |
      | SP-26-INT-02 |

  @SP-26 @SP-26-INT-03 @pending
  Scenario Outline: SP-26-INT-03: standaard herstellen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-26-INT-03 nog uit te werken

    Examples:
      | id |
      | SP-26-INT-03 |

  @SP-26 @SP-26-INT-04 @pending
  Scenario Outline: SP-26-INT-04: preview toggelen: succesvolle actie, failure response, loading en undo/confirm waar relevant.
    Given TODO: SP-26-INT-04 nog uit te werken

    Examples:
      | id |
      | SP-26-INT-04 |

  @SP-26 @SP-26-VIS-01 @pending
  Scenario Outline: SP-26-VIS-01: vergelijking met designreferentie op vaste viewport, na toegestane verschillen in dynamische media en tekst.
    Given TODO: SP-26-VIS-01 nog uit te werken

    Examples:
      | id |
      | SP-26-VIS-01 |

  @SP-26 @SP-26-A11Y-01 @pending
  Scenario Outline: SP-26-A11Y-01: keyboard-only, WCAG 2.2 AA contrastcontrole, screenreader labels en reduce-motion.
    Given TODO: SP-26-A11Y-01 nog uit te werken

    Examples:
      | id |
      | SP-26-A11Y-01 |
