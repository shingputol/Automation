*** Settings ***
Documentation   DataDriver Testing with excel   
Library         Selenium2Library
Library         DataDriver    ../TestData/LoginData.xlsx    sheet_name=Sheet1
Resource        ../Resources/LoginKeywords.robot
Test Template   Read All The Data

Suite Setup     Open my Browser     ${SiteUrl}  ${browser}
Suite Teardown  Close browser

*** Variables ***
${SiteUrl}      https://www.staging-app.livestockbarometer.com/login
${browser}      chrome



*** Keywords ***
Read All The Data
    [Arguments]     ${email}    ${password}
    Log To Console  ${email} : ${password} 
    Enter email     ${email}
    Enter password  ${password}
    Click Login
    sleep   1s
    ${login_status}=    Run Keyword And Return Status    Verify invalid login
    Log     ${login_status}
    Run Keyword If   '${login_status}' == 'True'    Clear Login
    Run Keyword If   '${login_status}' == 'False'   Logout
    sleep   3s
  

*** Test Cases ***
Verify All The Data from excel_${email}_${password}
    [Template]    Verify All Data
    ${email}    ${password}

*** Keywords ***
Verify All Data
    [Arguments]    ${email}    ${password}
    Read All The Data    ${email}    ${password}