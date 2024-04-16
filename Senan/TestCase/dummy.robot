*** Settings ***
Resource        ../Resources/Page_Object_AddUser.robot
# Documentation   DataDriver Testing with excel   
Library         Selenium2Library
Library        ../PageObject/RandomStringGenerator.py

# Library         DataDriver    ../TestData/UserData.xlsx    sheet_name=Sheet1

Suite Setup     Open a Browser    ${SiteUrl}    ${browser}
Suite Teardown    Close Browser

*** Variables ***
${SiteUrl}    https://staging-senan.mugna.tech/cca-admin/
${browser}    chrome
${valid_userEmail}    admin@mugna.tech
${valid_userPassword}    Welcome1234!
${prefix}    sheilamaeputol+test
${password1}    Shing@1234
${confirm_password}    Shing@1234
${Firstname}     Shing1
${Lastname}    Shing1
${UserType}    Administrator
${Company}    Company1




*** Test Cases ***
Login and Access users Page
    [Documentation]    Logs in as an admin user
    Login an Admin    ${valid_userEmail}    ${valid_userPassword}
     
Execute Add New User and Add User Information 3 Times
    FOR    ${index}    IN RANGE    3
       Click Add User
       Add New User
       Add User Information
    END


*** Keywords ***
Add New User
    [Documentation]    Adds New User
    ${random_string}=    Generate Random String    5
    Log    ${random_string}
    ${email1}=       Evaluate    "${prefix}_${random_string}@mail.com".replace(" ", "")
    Add Users field and Submit    ${email1}    ${password1}    ${confirm_password}
Add User Information
    [Documentation]    Adds New User Information
    Add User Info    ${Firstname}    ${Lastname}    ${UserType}    ${Company}
    Sleep    5s
    