*** Settings ***
Resource    ../../../resources/settings.robot
Resource    ../../../resources/variables.robot
Resource    ../../../resources/locators.robot
Resource    ../../../keywords/prospend_qa_keyword.robot

*** Test Cases ***
Login To Prospend QA ENv
    [Tags]    regression  all  claim
    Login To QA Website
