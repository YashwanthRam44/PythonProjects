*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn.Sleep

*** Variables ***
${LOGIN_PAGE_URL}     https://www.saucedemo.com/v1/inventory.html
${browser}            chrome

*** Test Cases ***
AT00_Practice

        Given User should be on Saucedemo Inventory
        Then Click on a selected product
        Then Click on Add to cart
        Then Click on cart

*** Keywords ***
User should be on Saucedemo Inventory
    Open Browser  ${LOGIN_PAGE_URL}  ${browser}
    Maximize browser window
    Sleep    5s
Click on a selected product
    Click Element  xpath=//*[contains(text(),'Sauce Labs Backpack')]
    Sleep    1s
   # Click Button  xpath=//div[normalize-space()='Sauce Labs Backpack']
Click on Add to cart
    Click Button  xpath=//button[normalize-space()='ADD TO CART']
    Sleep    1s
Click on cart
    Click element   xpath=//*[name()='path' and contains(@fill,'currentCol')]
    Sleep    5s
    Close browser



