*** Settings ***
Resource    ../Resources/DataManager.robot
Resource    ../Resources/AppOrangeHRM.robot
Resource    ../Data/InputData.robot


# robot -d Results Tests/tests_incorrect_login.robot

*** Test Cases ***

Test Incorrect Login
    [Tags]    TestID:4001       LoginPage      Error
    ${Invalid login datas}    DataManager.Get Csv Data     ${csv_file}
    AppOrangeHRM.Login with incorrect credentials       ${Invalid login datas}