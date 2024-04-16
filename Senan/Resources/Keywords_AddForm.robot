*** Settings ***
Library    Selenium2Library
Variables    ../PageObject/AdminLocators.py


*** Keywords ***
#--------------------- Compliance Criticality Keywords -------------------------     
Open Compliance
    Click Link    ${link_Compliance}
    Sleep    1s
Click Add Compliance Criticality
    Click Link    ${btn_Add_CCAForm}
    Sleep    1s
Add Compliance Criticality Information
    [Arguments]    ${Compliance_Company}    ${Compliance_BusinessOwner}    ${Compliance_SystemOwner}    ${Compliance_ItRisk}
    #Enter Company Name
    Click Element    ${dropDown_Compliance_Company}
    Wait Until Element Is Visible    xpath://*[@id="select2-id_company-results"]
    Input Text    xpath:/html/body/span/span/span[1]/input    ${Compliance_Company}
    Sleep    1s
    #Select From List By Index    ${dropDown_Compliance_Company}    1
    Click Element    xpath://*[@id="select2-id_company-results"]/li
    Sleep    1s

    

    
#Enter Business Owner
    Click Element    ${dropDown_BusinessOwner}
    Wait Until Element Is Visible    xpath://*[@id="select2-id_business_owner-results"]
    Input Text    xpath:/html/body/span/span/span[1]/input    ${Compliance_BusinessOwner}
    Sleep    1s
    Click Element    xpath://*[@id="select2-id_business_owner-results"]/li
    Sleep    1s

    #Enter System Owner
    Click Element    ${dropDown_SystemOwner}
    Wait Until Element Is Visible    xpath://*[@id="select2-id_system_owner-results"]
    Input Text    xpath:/html/body/span/span/span[1]/input    ${Compliance_SystemOwner}
    Sleep    1s
    Click Element    xpath://*[@id="select2-id_system_owner-results"]/li
    Sleep    1s

    #Enter IT Risk
    Click Element    ${dropDown_ItRisk}
    Wait Until Element Is Visible    xpath://*[@id="select2-id_it_risk_management_and_compliance-results"]
    Input Text    xpath:/html/body/span/span/span[1]/input   ${Compliance_ItRisk}
    Sleep    1s
    Click Element    xpath://*[@id="select2-id_it_risk_management_and_compliance-results"]/li
    Sleep    2s

Add Solution Identification
    [Arguments]    ${Compliance_SolutionName}    ${Compliance_SoftwareRelease}    ${Compliance_VendorName}    ${Compliance_SolutionType}    ${Compliance_Hosting}    ${Compliance_ServerHost}    ${Compliance_Classification}  
    #Enter Solution Identification
    Input Text    ${txt_SolutionName}    ${Compliance_SolutionName}
    Input Text    ${txt_SoftawareRelease}    ${Compliance_SoftwareRelease}
    Input Text    ${txt_VendorName}    ${Compliance_VendorName}
    Select From List By Label    ${dropDown_SolutionType}    ${Compliance_SolutionType}
    Select From List By Label    ${dropDown_HostingandType}    ${Compliance_Hosting}
    Input Text    ${txt_ServerHost}    ${Compliance_ServerHost}
    Select From List By Label    ${dropDown_SolutionClasification}   ${Compliance_Classification}
    Click Button    ${btn_CCAForm_Save}
