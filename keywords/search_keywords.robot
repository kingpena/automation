*** Settings ***
Resource   ../variables.robot
Resource   ../locators.robot
Library    SeleniumLibrary

*** Keywords ***
Open Google Homepage
    Open Browser    ${SEARCH_ENGINE_URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_BOX}

Search For Term
    [Arguments]    ${term}
    Input Text    ${SEARCH_BOX}    ${term}
    Press Keys    ${SEARCH_BOX}    ENTER

Verify Search Results
    Wait Until Page Contains Element    ${RESULT_STATS}
    Log    Search results are visible
