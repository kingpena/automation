*** Settings ***
Resource    ../resources/settings.robot
Resource    ../resources/keywords/search_keywords.robot

*** Test Cases ***
Search On Google
    [Tags]    search
    Open Google Homepage
    Search For Term    Robot Framework
    Verify Search Results
