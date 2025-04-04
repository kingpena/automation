*** Variables ***
${RANDOM_INVOICE_NUMBER}=    Evaluate    "Text_automation-" + str(random.randint(1000, 9999))  random