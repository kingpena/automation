*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot
Resource   locators.robot

Suite Setup    Setup Suite
Suite Teardown    Teardown Suite

*** Keywords ***
Setup Suite
    Log    Starting Test Suite

Teardown Suite
    Close All Browsers
    Log    Ending Test Suite
