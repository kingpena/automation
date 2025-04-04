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
    ${invoiceNo}=  Generate Random Invoice No
    ${SUPPLIER_INVOICE}=  Setup Supplier Invoice Payload  ${invoiceNo}
    ${headers}    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}    POST On Session   mysession    /api/claim/fulladd.go  data=${SUPPLIER_INVOICE}    headers=${headers}   cookies=${COOKIES}
    Log    Response Status: ${response.status_code}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200

Generate Random Invoice No
    ${random_invoice_no}=  Generate Random String  10  # Generate a 10-character random string for the invoice number
    [Return]  invoice-${random_invoice_no}

Setup Supplier Invoice Payload
   [Arguments]  ${invoiceNo}
       ${invoice}=  Create Dictionary
       ...    claimId=None
       ...    claimTypeId=12
       ...    claimTypeDesc=Supplier Invoice
       ...    claimStatusId=0
       ...    claimStatusDesc=None
       ...    created=None
       ...    billCycleId=None
       ...    claimDateStart=2025-04-04
       ...    claimDateTo=None
       ...    claimantId=4645
       ...    claimantName=Kylie Magenta
       ...    authorityId=None
       ...    divisionId=None
       ...    departmentId=184
       ...    claimDivisionId=1141
       ...    departmentName=Australia
       ...    supplierId=18320
       ...    supplierCode=NAKAMA
       ...    abn=None
       ...    payTo=Nakama
       ...    reference=None
       ...    invoiceNo=${invoiceNo}
       ...    dueDate=
       ...    name=Supplier Invoice
       ...    linkClaimIds=None
       ...    taxFlag=e
       ...    disputedTotal=0
       ...    personalTotal=0
       ...    expenseTotal=0
       ...    workflowId=1574
       ...    stepNo=None
       ...    completedOn=None
       ...    completePurchaseOrder=False
       ...    requiresPurchaseOrder=False
       ...    purchaseNo=None
       ...    cancelDate=None
       ...    importId=None
       ...    exportId=None
       ...    exportRef=None
       ...    expenses=[]
       ...    steps=[]
       ...    notes=[]
       ...    fields=[]
       ...    forwardBalance=0
       ...    newBalance=0
       ...    newCredits=0
       ...    invoiceScanning=False
       ...    paymentInfoAcknowledged=False
       ...    cardId=None
       ...    linkClaimMarkedForClose=False
       ...    cardStatus=None
       ...    scheduledFreezeOn=None
       ...    payByCheque=Y
       ...    accountName=
       ...    accountBsb=
       ...    accountNo=
       ...    bpayReference=None
       ...    bpayBiller=None
       ...    variance=None
       ...    allowAcknowledgePaymentInfoMismatch=False
       ...    externalBillLink=None
       ...    approvalComment=None
       ...    approverAcknowledged=None
       ...    source=None
       ...    purchaseOrder={deliveryDate=None, deliveryAddr1=None, deliveryAddr2=None, deliveryAddr3=None, country=None, contactCompany=None, contactName=None, contactPhone=None, deliveryInstructions=None, showAmounts=y, emailPO=False, emailTo=}
       ...    cardOrder={cardOrderId=None, companyId=None, claimId=None, cardholderPhone=None, orderIssuedOn=None, orderIssuedBy=None, cardEndDate=None, status=None, cardOrderStatus=None, deliveryEstimate=None, trackingUrl=None, lifetimeLimitAmount=None, transactionLimitAmount=None, dailyLimitAmount=None, monthlyLimitAmount=None, billingAddress={address1=None, address2=None, city=None, state=None, postCode=None, countryCode=None}, rules=[], cardLabel=None, validationStatus=None, validationReason=None, embossedName=None}
       ...    invoiceApprovalOption=GO_THROUGH_APPROVAL
       ...    supplierValidationAcknowledged=False
       [Return]  ${invoice}

End Test Automation
    # Close the browser after the test
    Close Browser