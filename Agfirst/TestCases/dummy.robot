*** Settings ***
Documentation   DataDriver Testing with excel   
Library         Selenium2Library
Library         DataDriver    ../TestData/LoginData.xlsx    sheet_name=Sheet1
Test Template   Read All The Data
Resource        ../Resources/LoginKeywords.robot

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
    Run Keyword If    '${login_status}' == 'PASS'    Clear Login    
        ELSE    
        Run Keywords    
            Logout
            Clear Login  
    sleep   2s


    




*** Test Cases ***
Verify All The Data from excel      ${email}    ${password}