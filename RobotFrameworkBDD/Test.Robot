*** Settings ***
Library           DataDriver  file=Resources/Yash.csv
Test Template     Login With User And Password

*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
Login With User And Password
    [Arguments]    ${username}    ${password}
    Log Many    ${username}    ${password}