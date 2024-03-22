*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary
#Library   BuiltIn.Sleep

*** Variables ***
${LOGIN_PAGE_URL}        https://www.saucedemo.com/
${USERNAME}              standard_user
${PASSWORD}              secret_sauce
${FirstFilter}           Name (low to high)

*** Test Cases ***
AT04_VerifyLowToHighfilter
    [Tags]  FunctionalTest
    Given user logs into SwagLabs
    Then user clicks on sort filter
    And Assert that all the items are orgainsed in price low to high order
    Then Close Browser

*** Keywords ***
user logs into SwagLabs
    Open Browser    ${LOGIN_PAGE_URL}    chrome
    Maximize Browser Window
    Input Text      id:user-name         ${USERNAME}
    Input Text      id:password          ${PASSWORD}
    Click Button    id:login-button

user clicks on sort filter
    ${FilterList}    Get WebElements    xpath=//*[@class='product_sort_container']/option
    ${filter_size}   Get length   ${FilterList}
    Log    filter_size:${filter_size}
    Log    FirstElementNameIs:${FilterList[0].text}

    FOR    ${i}    IN RANGE    ${filter_size}
        ${filter_name}    Get text    ${FilterList}[${i}]
        Log    FilterName: ${filter_name}
        ${condition}    Evaluate    '${filter_name}' == 'Price (low to high)'
        Run Keyword If   ${condition}  Click Element  ${filter_list}[${i}]
        Sleep  1s
        Run Keyword If   ${condition}  Exit For Loop
    END

