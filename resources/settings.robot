*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

Suite Setup    Setup Suite
Suite Teardown    Teardown Suite

*** Keywords ***
Setup Suite
    Log    Suite Setup Completed

Teardown Suite
    Log    Suite Teardown Completed
