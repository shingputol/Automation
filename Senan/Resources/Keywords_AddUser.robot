*** Settings ***
Library         Selenium2Library
Variables       ../PageObject/AdminLocators.py



*** Keywords ***
#--------------------- Login Keywords -------------------------
Select Option From Dropdown
    [Arguments]    ${dropdown_locator}    ${option_label}
    Select From List By Label    ${dropdown_locator}    ${option_label}

Open a Browser
    [Arguments]     ${SiteUrl}  ${browser}
    Open browser    ${SiteUrl}  ${browser}
    maximize browser window
Login an Admin
    [Arguments]   ${userEmail}    ${userPassword}
    Input Text    ${txt_Email}    ${userEmail}
    Input Password    ${txt_Password}    ${userPassword}
    Click Button    ${btn_login}
    Sleep    3s
#--------------------- Users Keywords -------------------------
Open Users
    Click Link    ${link_Users}
    Sleep    3s

Click Add User
    Click Link    ${btn_Add_User}
    Sleep    3s
Add Users field and Submit
    [Arguments]   ${userEmail}    ${userPassword}    ${userConfirmPassword}
    Input Text    ${txt_NewEmail}    ${userEmail}
    Input Password    ${txt_NewPassword}    ${userPassword}
    Input Password    ${txt_ConfirmPassword}    ${userConfirmPassword}
    Click Button    ${btn_Save}
    Sleep    3s
Add User Info
    [Arguments]     ${user_Firstname}    ${user_Lastname}    ${user_UserType}    ${user_Company}
    Input Text    ${txt_Firstname}    ${user_Firstname}
    Input Text    ${txt_Lastname}    ${user_Lastname}
    Select From List by Label    ${dropDown_UserType}    ${user_UserType}
    Click Element    ${dropDown_Company}
    Wait Until Element Is Visible    xpath=//li[@class="select2-results__option"]
    #Click Element    xpath=/html/body/span/span/span[2]/ul/li[12]
    #Select Option From Dropdown    xpath=//*[@class="select2-results__option"]    ${user_Company}
    Input Text    xpath:/html/body/span/span/span[1]/input    ${user_Company}
    Click Element    xpath://*[@id="select2-id_company-results"]/li
    Sleep    3s
    Click Button    ${btn_Save}
    Sleep    3s


