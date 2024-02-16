Language: Finnish

*** Settings ***
Kirjasto    Browser
Kirjasto    JSONLibrary

*** Avainsanat ***
Valitse reseptihaku
    ${reseptihaku} =    Get Element     //*[@id="main-navi"]//a[contains(text(),'Reseptihaku')]
    Click               ${reseptihaku}

Hae resepti ${reseptinimi}
    ${hakukenttä} =     Get Element   //*[@id="search-recipe-form"]//input
    Scroll To           ${hakukenttä}
    Type Text           ${hakukenttä}    ${reseptinimi}
    ${hae-nappi} =      Get Element   //*[@id="search-recipe-form"]/button[contains(text(),"Hae")]
    Click               ${hae-nappi}

Suodata kategorialla ${kategoria}
    ${kategoria} =      Get Element   //*[contains(@class,"category-radiobuttons")]//input[@type="radio" and @data-alias="${kategoria}"]
    Click               ${kategoria}

Suodata pääraaka-aineella ${pääraaka-aine}
    ${pääraaka-aine} =      Get Element   //input[@type="checkbox" and @data-alias="${pääraaka-aine}"]
    Click                   ${pääraaka-aine}

Tarkista, että hakutulos on isompi kuin ${min}
    ${hakutulos-kenttä} =      Get Element   //span[@id="search-results-amount"]
    ${hakutulos-teksti} =      Get Text    ${hakutulos-kenttä}
    ${min-määrä} =             Convert To Integer    ${min}
    ${hakutulos-määrä} =       Convert To Integer    ${hakutulos-teksti}
    Should Be True             ${hakutulos-määrä} > ${min-määrä}     msg="Hakutulos (${hakutulos-määrä}) pitäisi olla isompi kuin ${min-määrä}!"

Avaa löydetty resepti järjestysnumeron mukaan ${järjestysnumero} ja tulosta raaka-aineet
    ${resepti} =            Get Element     //*[@id="recipe-search-results"]/li[${järjestysnumero}]
    Click                   ${resepti}
    ${ld+json elementti} =  Get Element     //script[@type="application/ld+json" and contains(text(),"recipeIngredient")]
    ${ld+json string} =     Get Text    ${ld+json elementti}
    ${ld+json resepti} =    Convert String To Json  ${ld+json string}
    ${raaka-aineet} =       Get Value From Json     ${ld+json resepti}  $..recipeIngredient
    Log To Console          ${raaka-aineet}