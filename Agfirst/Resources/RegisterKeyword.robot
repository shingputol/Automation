*** Settings ***
Library         Selenium2Library
Variables       ../PageObject/Locators.py

*** Keywords  ***
#Register
Click Signup
    click button    ${lnk_Signup}

Verify register form
    page should contain     Create new account

Enter firstname
    [Arguments]     ${first_name}
    input text      ${txt_First_Name}   ${first_name}

Enter lastname
    [Arguments]     ${last_name}
    input text      ${txt_Last_Name}    ${last_name}

Enter phone
    [Arguments]    ${phone}
    input text     ${txt_Phone_Number}  ${phone}

Enter new_email
    [Arguments]     ${email_ad}
    input text      ${txt_New_email}    ${email_ad}
    
   
Enter new_password
    [Arguments]    ${password1}
    input text     ${txt_Password1}     ${password1}
   
    
Enter confirm password
    [Arguments]     ${password2}
    input text      ${txt_Password2}    ${password2}

Check Terms
    ${checkbox_status}=    Run Keyword And Return Status    Get Element Attribute    ${chk_Terms}@checked
    Run Keyword If    not "${checkbox_status}" == "true"
...    Click Element    ${chk_Terms}


Click Create an account
    click button    ${btn_Create}
    