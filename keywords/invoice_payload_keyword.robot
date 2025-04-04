*** Keywords ***

Generate Random Invoice Number
    ${value}=  Evaluate  "INV-AUTOMATION-TEST" + str(random.randint(1000, 9999))  modules=random
    [Return]  ${value}

Replace Invoice Number
    [Arguments]  ${json_string}  ${new_invoice_no}
    ${invoice_data}=  Evaluate  json.loads('''${json_string}''')  json
    Set To Dictionary  ${invoice_data}  invoiceNo=${new_invoice_no}
    ${updated_json}=  Evaluate  json.dumps(${invoice_data}, indent=2)  json
    [Return]  ${updated_json}

Generate Supplier Invoice With Random Invoice No
    ${random_invoice}=  Generate Random Invoice Number
    ${supplier_invoice}=  Replace Invoice Number  ${SUPPLIER_INVOICE_JSON}  ${random_invoice}
    [Return]  ${supplier_invoice}

