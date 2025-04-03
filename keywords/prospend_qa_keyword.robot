*** Keywords ***
Login To QA Website
    Open Browser     ${PROSPEND_LUCIFER_URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window
    Input Text      ${PROSPEND_USERNAME_BOX}    ${PROSPEND_USERNAME}
    Input Text      ${PROSPEND_PASSWORD_BOX}   ${PROSPEND_PASSWORD}
    Click Button    ${PROSPEND_LOGIN_BTN}
    Wait Until Page Contains Element    ${PROSPEND_LOGOUT_BTN}    timeout=10s

    ${cookies}    Get Cookies
    ${cookie_string}    Evaluate    json.dumps(${cookies})    json
    Set Suite Variable    ${COOKIES}    ${cookie_string}  # Store cookies for reuse

Call Claim List Search
    Create Session    mysession    ${PROSPEND_URL}

    ${params}    Create Dictionary    claimStatusId=-2    claimantId=-1    divisionId=-1    limit=30    offset=0    sortOrder=desc
    ${headers}    Create Dictionary    Content-Type=application/json    Accept=application/json

    # Convert cookies to dictionary (if needed)
    ${cookie_dict}    Evaluate    json.loads('''${COOKIES}''')    json

    ${response}    GET On Session    mysession    ${CLAIM_SEARCH_API}    params=${params}    headers=${headers}    cookies=${cookie_dict}

    Log    Response Status: ${response.status_code}
    Log    Response Body: ${response.json()}

    Should Be Equal As Strings    ${response.status_code}    200

    Close Browser
