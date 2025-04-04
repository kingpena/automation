*** Keywords ***
Supplier Invoice Request Body
    [Arguments]    ${RANDOM_INVOICE_NUMBER}
    ${CLAIM_INVOICE}=    Create Dictionary
    ...    abn=None
    ...    accountBsb=""
    ...    accountName=""
    ...    accountNo=""
    ...    allowAcknowledgePaymentInfoMismatch=False
    ...    approvalComment=None
    ...    approverAcknowledged=None
    ...    authorityId=None
    ...    billCycleId=None
    ...    bpayBiller=None
    ...    bpayReference=None
    ...    cancelDate=None
    ...    cardId=None
    ...    cardOrder={"cardOrderId": None, "companyId": None, "claimId": None, "cardholderPhone": None, "orderIssuedOn": None}
    ...    cardStatus=None
    ...    claimDateStart="2025-04-04"
    ...    claimDateTo=None
    ...    claimDivisionId=1141
    ...    claimId=None
    ...    claimStatusDesc=None
    ...    claimStatusId=0
    ...    claimTypeDesc="Supplier Invoice"
    ...    claimTypeId=12
    ...    claimantId=4645
    ...    claimantName="Kylie Magenta"
    ...    completePurchaseOrder=False
    ...    completedOn=None
    ...    created=None
    ...    departmentId=184
    ...    departmentName="Australia"
    ...    disputedTotal=0
    ...    divisionId=None
    ...    dueDate=""
    ...    expenseTotal=0
    ...    expenses=[]
    ...    exportId=None
    ...    exportRef=None
    ...    externalBillLink=None
    ...    fields=[]
    ...    forwardBalance=0
    ...    importId=None
    ...    invoiceApprovalOption="GO_THROUGH_APPROVAL"
    ...    invoiceNo=${RANDOM_INVOICE_NUMBER}
    ...    invoiceScanning=False
    ...    linkClaimIds=None
    ...    linkClaimMarkedForClose=False
    ...    name="Supplier Invoice"
    ...    newBalance=0
    ...    newCredits=0
    ...    notes=[]
    ...    onHold=None
    ...    onHoldDate=None
    ...    payByCheque="Y"
    ...    payTo="Nakama"
    ...    paymentInfoAcknowledged=False
    ...    personalTotal=0
    ...    purchaseNo=None
    ...    purchaseOrder={"deliveryDate": None, "deliveryAddr1": None, "deliveryAddr2": None, "deliveryAddr3": None, "country": None}
    ...    contactCompany=None
    ...    contactName=None
    ...    contactPhone=None
    ...    country=None
    ...    deliveryAddr1=None
    ...    deliveryAddr2=None
    ...    deliveryAddr3=None
    ...    deliveryDate=None
    ...    deliveryInstructions=None
    ...    emailPO=False
    ...    emailTo=""
    ...    showAmounts="y"
    ...    reference=None
    ...    requiresPurchaseOrder=False
    ...    scheduledFreezeOn=None
    ...    source=None
    ...    stepNo=None
    ...    steps=[]
    ...    supplierCode="NAKAMA"
    ...    supplierId=18320
    ...    supplierValidationAcknowledged=False
    ...    taxFlag="e"
    ...    variance=None
    ...    workflowId=1574
    [Return]    ${payload}