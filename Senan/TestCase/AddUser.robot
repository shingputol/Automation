*** Settings ***
# Documentation   DataDriver Testing with excel   
Resource        ../Resources/Keywords_AddUser.robot
Library         Selenium2Library
Library        ../PageObject/RandomStringGenerator.py

# Library         DataDriver    ../TestData/UserData.xlsx    sheet_name=Sheet1

Suite Setup     Open a Browser    ${SiteUrl}    ${browser}
Suite Teardown    Close Browser

*** Variables ***
${SiteUrl}    https://api.senansolutionriskprofile.com/cca-admin/logout/
${browser}    chrome
${valid_userEmail}    hello@mugna.tech
${valid_userPassword}    S3n@n2023
${prefix}    sheilamaeputol+test
${password1}    Shing@1234
${confirm_password}    Shing@1234
${Firstname}     Shing_test
${Lastname}    Shing_test
${UserType}    Client
${Company}    Shing Corp
${number_of_users}    2



*** Test Cases ***
Login and Access users Page
    [Documentation]    Logs in as an admin user
    Login an Admin    ${valid_userEmail}    ${valid_userPassword}
Open Users Page
    [Documentation]    Redirect user to Users Page
    Open Users
     
Execute Add New User and Add User Information # Times
    FOR    ${index}    IN RANGE    ${number_of_users}
       Click Add User
       Add New User
       Add User Information
    END


*** Keywords ***
Add New User
    [Documentation]    Adds New User
    ${random_string}=    Generate Random String    2
    Log    ${random_string}
    ${email1}=       Evaluate    "${prefix}_${random_string}@mail.com".replace(" ", "")
    Add Users field and Submit    ${email1}    ${password1}    ${confirm_password}
Add User Information
    [Documentation]    Adds New User Information
    Add User Info    ${Firstname}    ${Lastname}    ${UserType}    ${Company}
    
    