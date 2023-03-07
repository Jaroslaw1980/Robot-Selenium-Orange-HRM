*** Settings ***
Library     SeleniumLibrary

Resource    ../Resources/PageObjects/Login_page.robot
Resource    ../Resources/Common.robot
Resource    ../Data/InputData.robot

Test Setup    Enter Page
Test Teardown    Close Browser

# robot -d Results Tests/tests_login.robot

*** Test Cases ***
Login should succeed with valid credentials
    [Tags]      TestID:1001    LoginPage      Smoke
    Input Text Into "Username" Field    ${login_credentials}[0]
    Input Text Into "Password" Field    ${login_credentials}[1]
    Click "Login" Button
    Logout User


Login without "Username" and "Password" should trigger error message
    [Tags]      TestID:1002     LoginPage       Error
    Click "Login" button
    Error Message For "Username" Field
    Error Message For "Password" Field

Login with "Username" and without "Password" should trigger error password message
    [Tags]      TestID:1003     LoginPage       Error
    Input text into "Username" field    ${login_credentials}[0]
    Click "Login" button
    Error Message For "Password" Field

Login with "Password" and without "Username" should trigger error password message
    [Tags]      TestID:1004     LoginPage       Error
    Input Text Into "Password" field    ${login_credentials}[1]
    Click "Login" button
    Error Message For "Username" Field

Login with invalid credentials should trigger "Invalid credentials" message
    [Tags]      TestID:1005    LoginPage        Error
    Input Text Into "Username" Field    ${invalid_username}
    Input Text Into "Password" Field    ${invalid_password}
    Click "Login" Button
    Invalid credentials message








