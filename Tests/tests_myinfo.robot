*** Settings ***
Library    SeleniumLibrary
Library     Collections
Resource    ../Resources/Common.robot
Resource    ../Resources/AppOrangeHRM.robot
Resource    ../Resources/PageObjects/My_info_page.robot

Test Setup    Login With Valid Credentials
Test Teardown    Logout and close page

# robot -d Results Tests/tests_myinfo.robot

*** Variables ***
${BROWSER}=     chrome
${BASE_URL}=    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

@{login_credentials}=   Admin   admin123

&{username_form}    firstname=Yaro
                ...     middlename=B
                ...     lastname=Baro
                ...     nickname=Master
                ...     employee_Id=456
                ...     other_id=123
                ...     drivers_license=567
                ...     license_expiry_date=2012-12-12
                ...     ssn_number=890
                ...     sin_number=098
                ...     date_of_birth=1980-12-12
                ...     military_service=us army
${list_to_verify}   pam      para        pam

*** Test Cases ***

Choose Personal data page and input personal data
    [Tags]      MyInfoPage
    Main Page Validation

    My Info Page Validation

    Input Value To MyInfo Form Field    ${my_info_firstname}    ${username_form.firstname}
    Input Value To MyInfo Form Field    ${my_info_middlename}    ${username_form.middlename}
    Input Value To MyInfo Form Field    ${my_info_lastname}    ${username_form.lastname}
    Input Value To MyInfo Form Field    ${my_info_nickname}    ${username_form.nickname}
    Input Value To MyInfo Form Field    ${my_info_employee_ID}    ${username_form.employee_Id}
    Input Value To MyInfo Form Field    ${my_info_other_id}    ${username_form.other_id}
    Input Value To MyInfo Form Field    ${my_info_driverlicense}    ${username_form.drivers_license}

    Input License Expiry Date    ${username_form.license_expiry_date}
    Choose Nationality
    Choose Martial Status

    Input Value To MyInfo Form Field    ${my_info_ssn}    ${username_form.ssn_number}
    Input Value To MyInfo Form Field    ${my_info_sin}    ${username_form.sin_number}

    Input Value To MyInfo Form Field    ${my_info_dateofbirth}    ${username_form.date_of_birth}

    Choose Female
    Choose Male
    Click Checkbox
    Input Value To MyInfo Form Field    ${my_info_military}    ${username_form.military_service}

    Click "Save" Form Button


# TODO write test for list value checking
Check Martial Status list values
    [Tags]    validation

    Main Page Validation

    My Info Page Validation

    Scroll Element Into View    //i[contains(@class, 'oxd-checkbox')]
    Wait Until Page Contains Element    //form/div//label[contains(text(), 'Marital Status')]/parent::div/following-sibling::div/div/div/div
    Click Element    //form/div//label[contains(text(), 'Marital Status')]/parent::div/following-sibling::div/div/div/div

    Sleep       2s

    Wait Until Page Contains Element    //div[@role='listbox']//div

    ${martial_statuses}     Get Webelements    //div[@role='listbox']//div

    FOR    ${element}       IN      ${martial_statuses}
              Append To List    @{list_names}      ${element.text}
    END
    @{list_names}       Should Be Equal    ${list_to_verify}

    Sleep       3s







