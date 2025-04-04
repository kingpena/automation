*** Variables ***
${BROWSER}             chrome
${CHROMEDRIVER_PATH}   ${CURDIR}../../drivers/chromedriver.exe
${SEARCH_ENGINE_URL}   https://www.google.com
${SEARCH_TERM}         Robot Framework
${EXPECTED_TEXT}       Robot Framework
${PROSPEND_LUCIFER_URL}  https://emsdev.lucifer.psqa.net/
${PROSPEND_USERNAME}     kylie.magenta
${PROSPEND_PASSWORD}     kylie123
${PROSPEND_USERNAME_ADMIN}     xbits
${PROSPEND_PASSWORD_ADMIN}     test
${COOKIES}    # Global variable for storing cookies
${HEADERS}   Create Dictionary    accept=application/json    accept-language=en-US,en;q=0.9    cache-control=no-cache    content-type=application/json
