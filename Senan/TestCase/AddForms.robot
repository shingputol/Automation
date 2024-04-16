*** Settings ***
Resource        ../Resources/Keywords_AddUser.robot
Resource    ../Resources/Keywords_AddForm.robot
Library         Selenium2Library
Library        ../PageObject/RandomStringGenerator.py

Suite Setup     Open a Browser    ${SiteUrl}    ${browser}
Suite Teardown    Close Browser
*** Variables ***
#Login variables
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
${number_of_forms}    1

#Compliance Criticality Variables
${Compliance_Form_Company}    Jaze Company
${Compliance_Form_BusinessOwner}    shing_test Automation1
${Compliace_Form_SystemOwner}    shing_test Automation2    
${Compliance_Form_ItRisk}    shing_test Automation3

${Compliance_Form_SolutionName}    Solution Test
${Compliance_Form_SoftwareRelease}    SoftwareRelease Test
${Compliance_Form_VendorName}      VendorName Test
${Compliance_Form_SolutionType}    Application
${Compliance_Form_Hosting}        Third Party Hosting
${Compliance_Form_ServerHost}    Server Host Test
${Compliance_Form_SolutionClasification}    Configurable


*** Test Cases ***
Login and Access users Page
    [Documentation]    Logs in as an admin user
    Login an Admin    ${valid_userEmail}    ${valid_userPassword}

Open Compliance Criticality Assessment
    [Documentation]    Redirect user to Compliane Criticality Assessment Page
    Open Compliance
    Sleep    1s

Execute Create CCA Form # Times
    FOR    ${index}    IN RANGE    ${number_of_forms}
       Create CCA Form
    END


*** Keywords ***        
Create CCA Form
    Click Add Compliance Criticality
    Sleep    3s
    Add Compliance Criticality Information    ${Compliance_Form_Company}    ${Compliance_Form_BusinessOwner}    ${Compliace_Form_SystemOwner}    ${Compliance_Form_ItRisk}
    Sleep    3s
    Add Solution Identification    ${Compliance_Form_SolutionName}    ${Compliance_Form_SoftwareRelease}    ${Compliance_Form_VendorName}    ${Compliance_Form_SolutionType}    ${Compliance_Form_Hosting}    ${Compliance_Form_ServerHost}    ${Compliance_Form_SolutionClasification}
    Sleep    3s   

