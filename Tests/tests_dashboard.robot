*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/AppOrangeHRM.robot

Test Setup    Login With Valid Credentials
Test Teardown    Logout and close page

# robot -d Results Tests/tests_dashboard.robot
*** Variables ***
${BROWSER}     chrome
${BASE_URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

@{login_credentials}   Admin   admin123

*** Test Cases ***
Main page should contain elements
    [Tags]    Dashboard Page

    Wait Until Page Contains Element    //header//h6[contains(., 'Dashboard')]

    Wait Until Page Contains Element      //img[@alt='client brand banner']

    Wait Until Page Contains Element      //input[@placeholder='Search']
    Wait Until Page Contains Element    //ul[@class='oxd-main-menu']//span[contains(., 'Admin')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'PIM')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Leave')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Time')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Recruitment')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'My Info')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Performance')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Dashboard')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Directory')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Maintenance')]
    Page Should Contain Element    //ul[@class='oxd-main-menu']//span[contains(., 'Buzz')]


    Wait Until Page Contains Element      //li[@class='oxd-userdropdown']

    Click Element    //li[@class='oxd-userdropdown']
    Wait Until Page Contains Element    //ul[@class='oxd-dropdown-menu']

    @{login_elements}       Get Webelements        //ul[@class='oxd-dropdown-menu']/li
    FOR    ${item}     IN        @{login_elements}
            Log    ${item.text}
    END

    ${count list}   Get Element Count        //ul[@class='oxd-dropdown-menu']/li
    Should Be Equal As Integers       ${count list}        4



