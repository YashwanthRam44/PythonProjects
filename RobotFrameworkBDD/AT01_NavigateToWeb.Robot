*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn

*** Variables ***
${LOGIN_PAGE_URL}     https://www.saucedemo.com/
${USERNAME}           standard_user
${PASSWORD}           secret_sauce
${browser}            chrome

*** Test Cases ***
AT01_NavigateToWeb
        Given user navigates to SwagLabs
        Then Enters username
        Then Enters password
        Then clicks on submit button

*** Keywords ***
user navigates to SwagLabs
    Open Browser  ${LOGIN_PAGE_URL}  ${browser}
Enters username
    Input Text  id=user-name  ${USERNAME}
Enters password
    Input Text  id=password  ${PASSWORD}
clicks on submit button
    Click Button  id=login-button
    Sleep  5s

