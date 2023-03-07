*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_username_field}   xpath=//input[@name='username']
${login_password_field}   xpath=//input[@name='password']
${login_login_button}       //button[@type='submit']

${login_error_message_for_username}       //label[contains(text(), 'Username')]/parent::div/following-sibling::span
${login_error_message_for_password}       //label[contains(text(), 'Password')]/parent::div/following-sibling::span
${login_error_message_for_invalid_credentials}        //p[contains(., 'Invalid credentials')]

*** Keywords ***
Input text into "Username" field
    [Arguments]     ${username_text}
    Input Text    ${login_username_field}   ${username_text}

Input text into "Password" field
    [Arguments]    ${password_text}
    Input Text    ${login_password_field}   ${password_text}

Click "Login" button
    Click Button    ${login_login_button}

Error message for "Username" field
    Page Should Contain Element    ${login_error_message_for_username}

Error message for "Password" field
    Page Should Contain Element    ${login_error_message_for_password}

Invalid credentials message
    Wait Until Page Contains Element     ${login_error_message_for_invalid_credentials}

