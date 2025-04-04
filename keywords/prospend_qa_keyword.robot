*** Keywords ***

Login To QA Website
    Create Session    mysession    ${PROSPEND_LUCIFER_URL}
    Open Browser     ${PROSPEND_LUCIFER_URL}    ${BROWSER}    executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window
    Input Text      ${PROSPEND_USERNAME_BOX}    ${PROSPEND_USERNAME}
    Input Text      ${PROSPEND_PASSWORD_BOX}   ${PROSPEND_PASSWORD}
    Click Button    ${PROSPEND_LOGIN_BTN}
    Wait Until Page Contains Element    ${PROSPEND_LOGOUT_BTN}    timeout=10s

    ${cookies}    Get Cookies    mysession
    # Store cookies in a variable for reuse
    Set Suite Variable    ${COOKIES}    ${cookies}

Call Claim List Search
    Create Session    mysession    ${PROSPEND_LUCIFER_URL}

    # Set up request parameters and headers for the API call
    ${params}    Create Dictionary    claimStatusId=-2    claimantId=-1    divisionId=-1    limit=30    offset=0    sortOrder=desc
    ${headers}    Create Dictionary    Content-Type=application/json    Accept=application/json

    # Make the API call to retrieve the claim list
    ${response}    GET On Session    mysession    /api/claim/search.go    params=${params}    headers=${headers}    cookies=${COOKIES}

    # Log the status code and response body for debugging purposes
    Log    Response Status: ${response.status_code}
    Log    ${response.json()}

    # Assert that the response status code is 200 (OK)
    Should Be Equal As Strings    ${response.status_code}    200

Create Supplier Invoice
    Create Session    mysession    ${PROSPEND_LUCIFER_URL}
    ${response}    POST On Session   mysession    /api/claim/fulladd.go   json=${CLAIM_INVOICE}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

    # Close the browser after the test
    Close Browser