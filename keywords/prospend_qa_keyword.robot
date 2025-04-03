*** Keywords ***
Login To QA Website
    Open Browser     ${PROSPEND_LUCIFER_URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window
    Input Text      ${PROSPEND_USERNAME_BOX}    ${PROSPEND_USERNAME}
    Input Text      ${PROSPEND_PASSWORD_BOX}   ${PROSPEND_PASSWORD}
    Click Button    ${PROSPEND_LOGIN_BTN}
    Wait Until Page Contains Element    ${PROSPEND_LOGOUT_BTN}    timeout=10s

    ${cookies}    Get Cookies
    Set Global Variable    ${COOKIES}    ${cookies}  # Store cookies globally

    Close Browser

Call Claim List Search
    ${session}    Create Session    mysession    ${PROSPEND_LUCIFER_URL}

    ${params}    Create Dictionary    claimStatusId=-2    claimantId=-1    divisionId=-1    limit=30    offset=0    sortOrder=desc
    ${headers}   Create Dictionary    Content-Type=application/json
    ${response}    GET    mysession    /api/claim/search.go    params=${params}    headers=${headers}    cookies=${COOKIES}

    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
