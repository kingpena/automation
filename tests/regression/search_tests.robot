*** Settings ***
Resource    ../resources/settings.robot
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
Search On Google
    [Tags]    search
    Open Google Homepage
    Search For Term    ${SEARCH_TERM}
    Verify Search Results
