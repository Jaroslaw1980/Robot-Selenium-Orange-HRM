*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/AppOrangeHRM.robot
Resource    ../Resources/PageObjects/Dashboard_page.robot

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

    Wait Until Page Contains Element    ${dashboard_header_text}

    Wait Until Page Contains Element      ${dashboard_client_banner}

    Wait Until Page Contains Element      ${dashboard_search_field}
    Wait Until Page Contains Element    ${dashboard_admin_tab}
    Page Should Contain Element    ${dashboard_PIM_tab}
    Page Should Contain Element    ${dashboard_Leave_tab}
    Page Should Contain Element    ${dashboard_Time_tab}
    Page Should Contain Element    ${dashboard_Recruitment_tab}
    Page Should Contain Element    ${dashboard_my_info_tab}
    Page Should Contain Element    ${dashboard_Performance_tab}
    Page Should Contain Element    ${dashboard_Dashboard_tab}
    Page Should Contain Element    ${dashboard_Directory_tab}
    Page Should Contain Element    ${dashboard_Maintanance_tab}
    Page Should Contain Element    ${dashboard_Buzz_tab}


    Wait Until Page Contains Element      ${dashboard_user_dropdown}

    Click Element    ${dashboard_user_dropdown}
    Wait Until Page Contains Element    ${dashboard_user_list}

    @{login_elements}       Get Webelements        ${dashboard_user_list}
    FOR    ${item}     IN        @{login_elements}
            Log    ${item.text}
    END

    ${count list}   Get Element Count        ${dashboard_user_list}
    Should Be Equal As Integers       ${count list}        4



