*** Settings ***
Resource    ../../../resources/settings.robot
Resource    ../../../resources/variables.robot
Resource    ../../../resources/locators.robot
Resource    ../../../keywords/prospend_qa_keyword.robot

*** Test Cases ***
Login To Prospend QA ENV
    [Tags]    regression  all  claim
    Login To QA Website

Claim List Search Valid Request
    [Tags]    regression  all  claim
    Call Claim List Search
