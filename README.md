# Tehtävä 2 - Toteuta automaatio

## Kuvaus: 
AlmaMedia - Almasta Kotikokkiin, kauppalista makaroonilaatikolle

## Vaiheet: 
1. Mene AlmaMedian sivuille https://www.almamedia.fi 
2. Navigoi Palvelut -> Tuotteet ja palvelut. 
3. Navigoi sivulta edelleen Kotikokki-lehden sivulle kuvan kautta. 
4. Kirjoita Kotikokki-sivulla hakukenttään makaroonilaatikko ja klikkaa hae-nappia. 
5. Valitse radionapeista ’Pastat ja nuudelit’ ja ’Makkara ja jauheliha’. 
6. Varmista, että saat hakutuloksia > 0 kpl. 
7. Valitse yksi resepti ja lisää se ostoslistalle. 
 
## Lopputilanne: 
8. Avaa ostoslista, lue ainekset listalta ja lokita konsolille. 

# Toteutus
Koska sivuilla ei ole löytynyt ostoslista, käytetään kotikokki.net sivustonkin käyttämä schema.org-in mukainen JSON+LD
määrityksen ruokaohjeesta. Lisätietoa schemasta: https://schema.org/Recipe

Ei käytetä datavetoinen, eikä BDD-tyyliä tässä, ei edes "test template"-kaan.
Kuitenkin käytän Robot Frameworkin suomen kielen version, jotta testistä tulisi mielestäni helpommin luetettava 
(päätarkoitus on minusta juuri se, eikä tyyli itsessään).

### Testi
* [tehtävä2](kotikokki/tehtävä2.robot).

### Resurssit
Yleinen apu-resurssi:
* [utils](kotikokki/utils.resource).

Kahdelle sivustolle oma resurssi:
* [almamedian_tuotteet](kotikokki/almamedian_tuotteet.resource),
* [kotikokki_net_reseptihaku](kotikokki/kotikokki_net_reseptihaku.resource).

## Docker
Buildataan kontti käyttäen Plyawright-image (aika iso image, mutta mukaan tulee näin valmiina: python3, node.js, yms.).
> docker build . -t rf

Dokcerfile asentaa viimeiset kirjastot konttiin: 
* pip
* robotframework
* RF: BrowserLibrary
* RF: JSONlibrary

Ajetaan testit headless modessa (Windows: volumet liitetään relatiivisella polulla: .\):
> docker run --name rf --rm -v .\kotikokki:/kotikokki -it rf:latest bash -c "robot -v headless:true --outputdir /kotikokki/output /kotikokki" 

## Raportti ja videot
Raportti ja videot tehty omalta koneelta ajettuna Dockerin läpi.

### Raportit

Raportti tulostuu [kotikokki/output-hakemistoon](kotikokki/output/report.html).

### Videot
Ajossa myös nauhoitetaan videot, mutta vain "New page" avainsanan yhteydessä lisätä report.html-ään, 
"Switch page"-ssä sitä ei tehdä ja se toinen video-pätkä näin ei ole lisätty raporttiin.

Tässä ne erikseen:
1. [Mennään Alma Median sivuille](kotikokki/output/browser/video/documentation/f56d4ae474e233851d93425863517cb9.webm)
2. [Avataan kotikokki.net ja kerätään kauppalista makaroonilaatikolle](kotikokki/output/browser/video/documentation/c6bafd85a638637d001ea1610ba9feae.webm)