*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PageObjects/Dashboard_page.robot

*** Variables ***
${Base_page_banner}    //div[@class='orangehrm-login-branding']

*** Keywords ***
Enter page
    Open Browser    ${BASE_URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element        ${Base_page_banner}

Logout and close page
    Logout user
    Close Browser