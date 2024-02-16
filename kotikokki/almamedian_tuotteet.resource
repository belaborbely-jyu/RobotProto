Language: Finnish

*** Settings ***
Kirjasto    Browser

*** Avainsanat ***
Avaa ${päävalikon teksti} ${alavalikon teksti}
    ${päävalikko} =     Get Element   //*[@id="navigation"]//a[text() = ${päävalikon teksti}]
    Click               ${päävalikko}
    ${alavalikko} =     Get Element     //*[@id="navigation"]//li[@class="alma-dropdown alma-trigger active"]//a[contains(text(), ${alavalikon teksti})]
    Click               ${alavalikko}

Etsi ja avaa tuote ${tuotenimi}
    ${tuote} =          Get Element     //*[@id="business-area-results"]//p[contains(text(),${tuotenimi})]
    Scroll To Element   ${tuote}
    Click               ${tuote}

