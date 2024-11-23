*** Keywords ***
Open Google Homepage
    Open Browser    ${SEARCH_ENGINE_URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window
    Wait Until Element Is Visible    ${SEARCH_BOX}    timeout=10s

Search For Term
    [Arguments]    ${term}
    Input Text    ${SEARCH_BOX}    ${term}
    Press Keys    ${SEARCH_BOX}    ENTER

Verify Search Results
    Wait Until Page Contains    ${EXPECTED_TEXT}
    Log    Verified search results are displayed
