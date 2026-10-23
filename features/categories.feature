Feature: Gebruikerscategorieën overleven providerverversing
  Background:
    Given er is een Space "Sports"
    And playlist "Provider A" bevat kanaal "ESPN" in categorie "NL SPORT"

  @DOM-CATEGORIES-GH-01 @pending
  Scenario: Lokale categorienaam blijft behouden na sync
    Given ik map "NL SPORT" naar lokale categorie "Sport"
    And ik geef lokale categorie "Sport" de beschrijving "Alle sportzenders"
    When playlist "Provider A" succesvol wordt vernieuwd
    Then blijft categorie "Sport" bestaan met dezelfde beschrijving
    And staat kanaal "ESPN" nog in categorie "Sport"
    And is de ruwe provider-categorie "NL SPORT" niet aangepast

  @DOM-CATEGORIES-GH-02 @pending
  Scenario: Een fout tijdens sync verandert het zichtbare resultaat niet
    Given een eerdere sync succesvol was
    When een verversing een ongeldige playlist oplevert
    Then wordt geen gedeeltelijke dataset gecommit
    And kan ik de oude kanalen blijven gebruiken
    And toont de applicatie een herstelbare fout

  # DATA_EN_CONTENT_MODELLEN.md:11: | Category | UUID | title, description, heroAsset, thumbnailAsset, order, visible | Originele providernaam niet overschrijven |
  @DOM-CATEGORIES-INV-01 @pending
  Scenario Outline: Pending invariant for Category
    Given TODO: invariant for Category nog uit te werken

    Examples:
      | case |
      | synthetic |
