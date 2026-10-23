Feature: Geïntegreerde EPG onderbreekt live-tv niet
  @DOM-LIVE_PLAYER-GH-01 @pending
  Scenario: Gids openen tijdens afspelen
    Given ik kijk live naar kanaal "Sport Live"
    And de stream speelt daadwerkelijk af
    When ik de geïntegreerde gids open
    Then blijft dezelfde player-sessie actief
    And worden huidige en volgende programma's getoond als EPG-data bestaat
    When ik de gids sluit
    Then blijft de player-sessie actief

  @DOM-LIVE_PLAYER-GH-02 @pending
  Scenario: EPG is niet beschikbaar
    Given een kanaal geen programmainformatie heeft
    When ik de gids open
    Then zie ik "Geen programmainformatie"
    And kan ik het kanaal nog steeds bekijken

  # DATA_EN_CONTENT_MODELLEN.md:20: Playback title: handmatige override > verified external metadata > provider title. Artwork: manual image > verified artwork > provider artwork > safe gradient. Categorie: handmatige Space override > global local mapping > normalized provider category > fallback Ongecategoriseerd. Provider refresh mag nooit handmatige metadata of mapping opzijzetten zonder expliciete user acceptance.
  @DOM-LIVE_PLAYER-INV-01 @pending
  Scenario Outline: Pending invariant for Playback title
    Given TODO: invariant for Playback title nog uit te werken

    Examples:
      | case |
      | synthetic |
