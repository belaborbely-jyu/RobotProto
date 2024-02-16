Language: Finnish

*** Asetukset ***
Kirjasto        Browser
Resurssi        utils.resource
Resurssi        almamedian_tuotteet.resource
Resurssi        kotikokki_net_reseptihaku.resource
Setin Alustus   Selaimen alustus
Setin Alasajo   Selaimen alasajo

*** Muuttujat ***
${ALMA_MEDIA_SIVUT} =       https://www.almamedia.fi
${ALMA_MEDIA_OTSIKKO} =     Alma Media

*** Testit ***
Almasta Kotikokkiin, kauppalista makaroonilaatikolle
    Mene AlmaMedia sivuille
    Avaa palvelut ja tuotteet
    Etsi ja avaa kotikokki.net
    Valitse reseptihaku
    Hae makaronilaatikko
    Suodata kategorialla "Pastat ja nuudelit"
    Suodata pääraaka-aineella "Makkkara ja jauheliha"
    Tarkista, että hakutulos on isompi kuin 0
    Avaa ensimmäinen resepti ja tulosta sen raaka-aineet

*** Avainsanat ***
Mene AlmaMedia sivuille
    New Page            ${ALMA_MEDIA_SIVUT}
    Get Title           ==  ${ALMA_MEDIA_OTSIKKO}
    Salli keksit

Avaa palvelut ja tuotteet
    Avaa "Palvelut" "Tuotteet ja palvelut"

Etsi ja avaa kotikokki.net
    Etsi ja avaa tuote "Kotikokki.net"
    # Aloittaa uusi videon, mutta ei lisä raporttiin :(
    Switch Page         NEW
    # Sallitaan paikan tunnistus, jotta voidaan jatkaa
    Grant Permissions   geolocation

Hae makaronilaatikko
     Hae resepti makaronilaatikko

Suodata kategorialla "Pastat ja nuudelit"
    Suodata kategorialla pasta

Suodata pääraaka-aineella "Makkkara ja jauheliha"
    Suodata pääraaka-aineella mixedmeat

Avaa ensimmäinen resepti ja tulosta sen raaka-aineet
    Avaa löydetty resepti järjestysnumeron mukaan 1 ja tulosta raaka-aineet