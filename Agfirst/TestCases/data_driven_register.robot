*** Settings ***
Documentation   DataDriver Testing with excel   
Library         Selenium2Library
Library         DataDriver    ../TestData/LoginData.xlsx    sheet_name=Sheet2
#Library         DataDriver    ../TestData/LoginData.csv
Resource        ../Resources/LoginKeywords.robot
Resource        ../Resources/RegisterKeyword.robot
Test Template   Read All The Data

Suite Setup     Open my Browser     ${SiteUrl}  ${browser}
Suite Teardown  Close browser

*** Variables ***
${SiteUrl}      https://www.staging-app.livestockbarometer.com/register
${browser}      chrome



*** Keywords ***
Read All The Data
    [Arguments]     ${first_name}    ${last_name}   ${phone_number}     ${new_email}    ${new_password}
    Log To Console  ${first_name} : ${last_name} : ${phone_number} : ${new_email} : ${new_password} 
    Enter firstname  ${first_name}
    Enter lastname  ${last_name}
    Enter phone     ${phone_number}
    Enter new_email  ${new_email}
    Enter new_password      ${new_password}
    Enter confirm password  ${new_password}
    Check Terms
    Click Create an account
    sleep   5s
    Verify Login Page 
    sleep   2s
    Click Signup
    Verify register form

    


*** Test Cases ***
Verify All The Data from excel_${first_name}_${last_name}
    [Template]    Verify All Data
    ${first_name}    ${last_name}   ${phone_number}     ${new_email}    ${new_password}

*** Keywords ***
Verify All Data
    [Arguments]    ${first_name}    ${last_name}   ${phone_number}     ${new_email}    ${new_password}
    Read All The Data    ${first_name}    ${last_name}   ${phone_number}     ${new_email}    ${new_password}