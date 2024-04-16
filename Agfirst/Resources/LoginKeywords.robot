*** Settings ***
Library         Selenium2Library
Variables       ../PageObject/Locators.py


*** Keywords ***

Open my Browser
    [Arguments]     ${SiteUrl}  ${browser}
    Open browser    ${SiteUrl}  ${browser}
    maximize browser window

Get Started
    click button    ${btn_GetStarted}

#Login
Verify Login Page
    title should be     Livestock Barometer App | AgFirst

Enter email
    [Arguments]     ${email}
    input text      ${txt_Email}    ${email}

Enter password
    [Arguments]     ${password}
    input text      ${txt_Password}     ${password}

Click Login
    click button    ${btn_Login}

Verify invalid login
    page should contain  Unable to log in with provided credentials

Verify valid login
    element should be visible   xpath://*[@id="root"]/div/div[1]/img

Clear Login
    clear element text      ${txt_Email}
    clear element text      ${txt_Password}

Logout
    click element   xpath://*[@id="root"]/div/div[1]/div/div[1]/button
    page should contain     Welcome back! Please login

#data driven login
