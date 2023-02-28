*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${dashboard_my_info_tab}    //li/a/span[contains(., 'My Info')]
${dashboard_user_dropdown}      //span[@class='oxd-userdropdown-tab']
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