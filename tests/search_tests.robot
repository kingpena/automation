*** Settings ***
Resource    ../resources/settings.robot
Resource    ../resources/variables.robot

*** Test Cases ***
Search On Google
    [Tags]    search
    Open Google Search Page
    Search For Term    ${SEARCH_TERM}
    Verify Search Results    ${EXPECTED_TEXT}
    [Teardown]    Close Browser
