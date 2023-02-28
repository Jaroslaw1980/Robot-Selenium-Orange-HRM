*** Settings ***
Documentation    Use to get data from external files
Library     ../CustomLibs/csv.py


*** Keywords ***
Get csv data
    [Arguments] ${FilePath}
    ${Data} =   Read Csv File    ${FilePath}
    [Return]    ${Data}