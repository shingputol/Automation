*** Settings ***
Library     Selenium2Library
Resource    ../Resources/LoginKeywords.robot

*** Variables ***

${SiteUrl}      https://www.staging-app.livestockbarometer.com
${browser}      chrome
${email_ad}        premium2@mail.com
${password_valid}   Shing1234
${password_invalid}     Shing12345

*** Test Cases ***
Getting Stared
    Open my Browser    ${SiteUrl}      ${browser}
    Get Started
    Verify Login Page
    sleep   3s
Login with invalid credentials
    Enter email  ${email_ad}
    Enter password  ${password_invalid}
    Click Login
    sleep       2s
    Verify invalid login
    sleep   2s
Login with valid credentials
    Clear Login
    Enter email     ${email_ad}
    Enter password  ${password_valid}    
    Click Login
    sleep   2s
    Verify valid login 
    sleep   2s

    
