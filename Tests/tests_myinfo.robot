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
${BROWSER}     chrome
${BASE_URL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

@{login_credentials}   Admin   admin123

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


Check Martial Status list values
    [Tags]    validation

    Main Page Validation
    My Info Page Validation
    Scroll Element Into View    ${my_info_checkbox}
    Wait Until Page Contains Element    ${my_info_martial_status_list}
    Click Element    ${my_info_martial_status_list}
    Wait Until Page Contains Element    ${my_info_martial_statuses}

    @{martial_statuses}     Get Webelements    ${my_info_martial_statuses}
    @{statuses}     Create List
    @{list_to_verify}   Create list
         ...    -- Select --
         ...    Single
         ...    Married
         ...    Other
    FOR    ${element}       IN      @{martial_statuses}
              Append To List    ${statuses}     ${element.text}
    END
    Log List    ${statuses}
    Log List    ${list_to_verify}
    Lists Should Be Equal    ${statuses}    ${list_to_verify}








