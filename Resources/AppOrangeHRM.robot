*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/PageObjects/Login_page.robot
Resource    ../Resources/Common.robot

*** Keywords ***
Login with valid credentials
    Enter Page
    Input text into "Username" field    ${login_credentials}[0]
    Input text into "Password" field    ${login_credentials}[1]
    Click "Login" button

Input Value to MyInfo form field
    [Arguments]    ${locator}        ${input value}
    Click Element    ${locator}
    Press Keys    ${locator}    CTRL+a  BACKSPACE
    Input Text    ${locator}    ${input value}

Login with incorrect credentials
    [Arguments]    ${login list}
    FOR     ${login}      IN       @{login list}
            Enter Page
            Input Text Into "Username" Field    ${login[0]}
            Input Text Into "Password" Field    ${login[1]}
            Click "Login" Button
            Close Browser
    END
