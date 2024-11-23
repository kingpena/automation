*** Keywords ***
Open Google Search Page
    Open Browser    ${SEARCH_ENGINE_URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    Wait Until Element Is Visible    xpath=//textarea[@name='q']    timeout=10s

Search For Term
    [Arguments]    ${search_term}
    Input Text    xpath=//textarea[@name='q']    ${search_term}
    Press Keys    xpath=//textarea[@name='q']    ENTER

Verify Search Results
    [Arguments]    ${expected_text}
    Wait Until Page Contains    ${expected_text}
    ${title}=    Get Title
    Should Contain    ${title}    ${expected_text}
