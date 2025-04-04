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
    Log    Generated Invoice Number: ${RANDOM_INVOICE_NUMBER}
    ${request_body}=    {"abn": null, "accountBsb": "", "accountName": "", "accountNo": "", "allowAcknowledgePaymentInfoMismatch": false, "approvalComment": null, "approverAcknowledged": null, "authorityId": null, "billCycleId": null, "bpayBiller": null, "bpayReference": null, "cancelDate": null, "cardId": null, "cardOrder": {"cardOrderId": null, "companyId": null, "claimId": null, "cardholderPhone": null, "orderIssuedOn": null}, "cardStatus": null, "claimDateStart": "2025-04-04", "claimDateTo": null, "claimDivisionId": 1141, "claimId": null, "claimStatusDesc": null, "claimStatusId": 0, "claimTypeDesc": "Supplier Invoice", "claimTypeId": 12, "claimantId": 4645, "claimantName": "Kylie Magenta", "completePurchaseOrder": false, "completedOn": null, "created": null, "departmentId": 184, "departmentName": "Australia", "disputedTotal": 0, "divisionId": null, "dueDate": "", "expenseTotal": 0, "expenses": [], "exportId": null, "exportRef": null, "externalBillLink": null, "fields": [], "forwardBalance": 0, "importId": null, "invoiceApprovalOption": "GO_THROUGH_APPROVAL", "invoiceNo": "invoice -2222", "invoiceScanning": false, "linkClaimIds": null, "linkClaimMarkedForClose": false, "name": "Supplier Invoice", "newBalance": 0, "newCredits": 0, "notes": [], "onHold": null, "onHoldDate": null, "payByCheque": "Y", "payTo": "Nakama", "paymentInfoAcknowledged": false, "personalTotal": 0, "purchaseNo": null, "purchaseOrder": {"deliveryDate": null, "deliveryAddr1": null, "deliveryAddr2": null, "deliveryAddr3": null, "country": null}, "contactCompany": null, "contactName": null, "contactPhone": null, "country": null, "deliveryAddr1": null, "deliveryAddr2": null, "deliveryAddr3": null, "deliveryDate": null, "deliveryInstructions": null, "emailPO": false, "emailTo": "", "showAmounts": "y", "reference": null, "requiresPurchaseOrder": false, "scheduledFreezeOn": null, "source": null, "stepNo": null, "steps": [], "supplierCode": "NAKAMA", "supplierId": 18320, "supplierValidationAcknowledged": false, "taxFlag": "e", "variance": null, "workflowId": 1574}
    ${response}    POST On Session   mysession    /api/claim/fulladd.go   ${request_body}    cookies=${COOKIES}
    Log    Response Status: ${response.status_code}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

    # Close the browser after the test
    Close Browser