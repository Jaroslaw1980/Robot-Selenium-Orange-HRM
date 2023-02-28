*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${my_info_page_validator}   //div[@class='oxd-brand-banner']
${my_info_firstname}   //input[@name='firstName']
${my_info_middlename}  //input[@name='middleName']
${my_info_lastname}    //input[@name='lastName']
${my_info_nickname}    //form/div//label[contains(text(), 'Nickname')]/parent::div/following-sibling::div/input
${my_info_employeeID}  //form[contains(@class, 'oxd')]//label[contains(text(), 'Employee Id')]/parent::div/following-sibling::div/input
${my_info_otherID}     //form[contains(@class, 'oxd')]//label[contains(text(), 'Other Id')]/parent::div/following-sibling::div/input
${my_info_driverlicense}   //form[contains(@class, 'oxd')]//label[contains(text(), 'Driver')]/parent::div/following-sibling::div/input
${my_info_licensedate}     //form[contains(@class, 'oxd')]//label[contains(text(), 'License Expiry Date')]/parent::div/following-sibling::div//input
${my_info_ssn}     //form[contains(@class, 'oxd')]//label[contains(text(), 'SSN Number')]/parent::div/following-sibling::div/input
${my_info_sin}     //form[contains(@class, 'oxd')]//label[contains(text(), 'SIN Number')]/parent::div/following-sibling::div/input
${my_info_nationality_list}     //form[contains(@class, 'oxd')]//label[contains(text(), 'Nationality')]/parent::div/following-sibling::div/div/div/div
${my_info_nationality}     //div[@role='option']/span[contains(text(), 'Polish')]
${my_info_martial_status_list}     //form/div//label[contains(text(), 'Marital Status')]/parent::div/following-sibling::div/div/div/div
${my_info_martial_status}      //div[@role='listbox']//span[contains(text(), 'Single')]
${my_info_dateofbirth}     //form[contains(@class, 'oxd')]//label[contains(text(), 'Date of Birth')]/parent::div/following-sibling::div//input
${my_info_gender_male}     (//input[@type='radio']/following-sibling::span)[1]
${my_info_gender_female}   (//input[@type='radio']/following-sibling::span)[2]
${my_info_military}    //form[contains(@class, 'oxd')]//label[contains(text(), 'Military Service')]/parent::div/following-sibling::div/input
${my_info_checkbox}    //i[contains(@class, 'oxd-checkbox')]
${my_info_click_save}  (//form[contains(@class, 'oxd')]//button)[1]


*** Keywords ***
My Info page validation
    Wait Until Page Contains Element    ${my_info_page_validator}

Input License Expiry Date
    [Arguments]    ${licensedate}
    Click Element    ${my_info_licensedate}
    Input Text    ${my_info_licensedate}     ${licensedate}

Choose nationality
    Click Element   ${my_info_nationality_list}
    Click Element    ${my_info_nationality}

Choose martial status
    Click Element       ${my_info_martial_status_list}
    Click Element    ${my_info_martial_status}

Choose Male
    Click Element    ${my_info_gender_male}

Choose Female
    Click Element    ${my_info_gender_female}

Click checkbox
    Click Element    ${my_info_checkbox}

Click "Save" form button
    Click Element    ${my_info_click_save}





