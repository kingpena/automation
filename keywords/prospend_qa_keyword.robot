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
    # Set up request parameters and headers for the API call
    ${params}    Create Dictionary    claimStatusId=-2    claimantId=-1    divisionId=-1    limit=30    offset=0    sortOrder=desc

    # Make the API call to retrieve the claim list
    ${response}=   Send GET Request With Param    /api/claim/search.go    ${params}

    # Log the status code and response body for debugging purposes
    Log    Response Status: ${response.status_code}
    Log    ${response.json()}

    # Assert that the response status code is 200 (OK)
    Should Be Equal As Strings    ${response.status_code}    200

Create Supplier Invoice
    ${supplier_invoice}=    Generate Supplier Invoice With Random Invoice No
    ${response}=   Send POST Request With Body     /api/claim/fulladd.go    ${supplier_invoice}
    Log    Response Status: ${response.status_code}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

    ${CLAIM_ID}=    Extract ClaimId From Response ${response}
    Log ${CLAIM_ID}

Extract ClaimId From Response
    [Arguments]  ${response}
    ${json_data}=  Convert To JSON  ${response.text}  # Convert the response to a JSON object
    ${claim_id}=  Get From JSON  ${json_data}  claimId  # Extract claimId from JSON
    [Return]  ${claim_id}

Build And Open URL
    [Arguments]  ${ENDPOINT}
    ${FULL_URL}=  Build URL  ${ENDPOINT}  # Build the dynamic URL
    Open URL In New Tab  ${FULL_URL}  # Open the URL in a new tab

Build URL
    [Arguments]  ${ENDPOINT}
    ${URL}=  Set Variable  ${PROSPEND_LUCIFER_URL}${ENDPOINT}  # Construct the full URL dynamically
    [Return]  ${URL}

Open URL In New Tab
    [Arguments]  ${URL}
    Execute JavaScript  window.open('${URL}', '_blank')  # Opens the URL in a new tab
    Sleep  3s  # Wait for the new tab to open
    Switch Window  NEW  # Switch to the new tab

End Test Automation
    # Close the browser after the test
    Close Browser