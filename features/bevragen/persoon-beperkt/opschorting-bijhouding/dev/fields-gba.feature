#language: nl

@gba
Functionaliteit: Gba Persoon beperkt: opschorting bijhouding velden vragen met fields

Regel: opschortingBijhouding mag niet worden gevraagd, omdat het automatisch wordt geleverd

  @fout-case
  Abstract Scenario: veld <fields> mag niet worden gevraagd, omdat het automatisch wordt geleverd 
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde   |
    | geslachtsnaam (02.40) | Maassen  |
    | geboortedatum (03.10) | 19830526 |
    En de persoon heeft de volgende 'inschrijving' gegevens
    | naam                                 | waarde   |
    | reden opschorting bijhouding (67.20) | O        |
    | datum opschorting bijhouding (67.10) | 20220829 |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                       | waarde                              |
    | type                       | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam              | Maassen                             |
    | geboortedatum              | 1983-05-26                          |
    | inclusiefOverledenPersonen | true                                |
    | fields                     | <fields>                            |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                      |
    | type     | https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.1 |
    | title    | Een of meerdere parameters zijn niet correct.               |
    | status   | 400                                                         |
    | detail   | De foutieve parameter(s) zijn: fields[0].                   |
    | code     | paramsValidation                                            |
    | instance | /haalcentraal/api/brp/personen                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code   | name      | reason                                        |
    | fields | fields[0] | Parameter bevat een niet toegestane veldnaam. |

    Voorbeelden:
    | fields                                    |
    | opschortingBijhouding                     |
    | opschortingBijhouding.reden               |
    | opschortingBijhouding.reden.code          |
    | opschortingBijhouding.reden.omschrijving  |
    | opschortingBijhouding.datum               |
    | opschortingBijhouding.datum.type          |
    | opschortingBijhouding.datum.datum         |
    | opschortingBijhouding.datum.langFormaat   |
    | opschortingBijhouding.datum.jaar          |
    | opschortingBijhouding.datum.maand         |
    | opschortingBijhouding.datum.onbekend      |
    | opschortingBijhouding,burgerservicenummer |
