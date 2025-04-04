*** Settings ***
Resource    ../../../resources/settings.robot
Resource    ../../../resources/variables.robot
Resource    ../../../resources/variables_claim_payload.robot
Resource    ../../../resources/locators.robot
Resource    ../../../keywords/prospend_qa_keyword.robot
Resource    ../../../keywords/api_request_keyword.robot

*** Test Cases ***
Login To Prospend QA ENV
    [Tags]    regression  all  claim
    Login To QA Website

Claim List Search Valid Request
    [Tags]    regression  all  claim
    Call Claim List Search

Create Supplier Invoice
    [Tags]    regression  all  claim
    Create Supplier Invoice

Close Test Automation
    [Tags]    regression  all
    End Test Automation