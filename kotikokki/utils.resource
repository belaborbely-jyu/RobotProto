Language: Finnish

*** Asetukset ***
Kirjasto    Browser

*** Avainsanat ***
Selaimen alustus
    New Browser
    ...                 Chromium
    ...                 headless=True
    ...                 args=["-start-maximized"]
    New Context
    ...                 recordVideo={'dir':'documentation', 'size':{'width':1920, 'height':1080}}
    ...                 viewport={'width':1920, 'height':1080}

Salli keksit
    ${salli keksit} =   Get Element    //*[@id="almacmp-modalConfirmBtn"]
    Click               ${salli keksit}

Selaimen alasajo
    Close Context
    Close Browser

