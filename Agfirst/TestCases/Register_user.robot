*** Settings ***
Library     Selenium2Library
Library    ../PageObject/RandomStringGenerator.py

Resource    ../Resources/LoginKeywords.robot
Resource    ../Resources/RegisterKeyword.robot



*** Variables ***
${SiteUrl}      https://www.staging-app.livestockbarometer.com
${browser}      chrome
${prefix}       agfirst
${phone_number}     6 872 7080
${new_password}     Shing1234
${PYTHON_SCRIPT}    check_character_limit.py


*** Test Cases ***
Getting Stared
    Open my Browser    ${SiteUrl}      ${browser}
    Get Started
    Verify Login Page
    sleep   3s

Go to Register
    Click Signup
    sleep   1
    Verify register form

Fill Registration
    ${random_string}=    Generate Random String    10
    Log    ${random_string}
    ${first_name}=      Evaluate    "${prefix}_${random_string}".replace(" ", "")
    ${last_name}=       Evaluate    "${prefix}_${random_string}".replace(" ", "")
    ${new_email}=       Evaluate    "${prefix}_${random_string}@mail.com".replace(" ", "")
    Set Global Variable    ${new_email}
    Enter firstname  ${first_name}
    Enter lastname  ${last_name}
    Enter phone     ${phone_number}
    Enter new_email  ${new_email}
    Enter new_password      ${new_password}
    Enter confirm password  ${new_password}
    Check Terms
    Click Create an account
    sleep   3s

Successful Registration
    Verify Login Page
    sleep   5s

Login new account
    Clear Login
    Log     ${new_email}
    Enter email     ${new_email}
    Enter password  ${new_password}    
    Click Login
    sleep   2s
    Verify valid login 
    sleep   2s
    Logout
    sleep 3s
    







    
