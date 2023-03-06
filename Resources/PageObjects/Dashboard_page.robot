*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${dashboard_header_text}    //header//h6[contains(., 'Dashboard')]
${dashboard_client_banner}      //img[@alt='client brand banner']
${dashboard_search_field}       //input[@placeholder='Search']
${dashboard_admin_tab}      //ul[@class='oxd-main-menu']//span[contains(., 'Admin')]
${dashboard_PIM_tab}        //ul[@class='oxd-main-menu']//span[contains(., 'PIM')]
${dashboard_Leave_tab}      //ul[@class='oxd-main-menu']//span[contains(., 'Leave')]
${dashboard_Time_tab}       //ul[@class='oxd-main-menu']//span[contains(., 'Time')]
${dashboard_Recruitment_tab}       //ul[@class='oxd-main-menu']//span[contains(., 'Recruitment')]
${dashboard_my_info_tab}    //li/a/span[contains(., 'My Info')]
${dashboard_Performance_tab}    //ul[@class='oxd-main-menu']//span[contains(., 'Performance')]
${dashboard_Dashboard_tab}      //ul[@class='oxd-main-menu']//span[contains(., 'Dashboard')]
${dashboard_Directory_tab}      //ul[@class='oxd-main-menu']//span[contains(., 'Directory')]
${dashboard_Maintanance_tab}    //ul[@class='oxd-main-menu']//span[contains(., 'Maintenance')]
${dashboard_Buzz_tab}       //ul[@class='oxd-main-menu']//span[contains(., 'Buzz')]
${dashboard_user_dropdown}      //span[@class='oxd-userdropdown-tab']

${dashboard_user_list}      //ul[@class='oxd-dropdown-menu']/li

${dashboard_user_logout}        //ul[@class='oxd-dropdown-menu']/li/a[contains(text(), 'Logout')]
*** Keywords ***

Main Page validation
    Wait Until Page Contains Element        ${dashboard_my_info_tab}
    Click Element    ${dashboard_my_info_tab}

Logout user
    Wait Until Page Contains Element    ${dashboard_user_dropdown}
    Click Element      ${dashboard_user_dropdown}
    Wait Until Page Contains Element    ${dashboard_user_logout}
    Click Element    ${dashboard_user_logout}