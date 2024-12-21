*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${url}                         https://reg.msu.ac.th/registrar/home.asp
${browser}                     gc
${locator_loginlink}           //*[@id="menutive"]/a[3]
${locator_username}            name=f_uid
${locator_password}            name=f_pwd
${locator_btnlogin}            //*[@id="ASPxRoundPanel1_RPC"]/table/tbody/tr[3]/td[2]/font/input
${locator_popup_afterlogin}    //*[@id="fancybox-content"]/div/a/img
${locator_close_popup}         //*[@id="fancybox-close"]
${locator_btnlogout}           //*[@id="menutive"]/a[3]


*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.5s
    Open Browser          ${url}    ${browser}
    Maximize Browser Window

Default Login Page
    Wait Until Element Is Visible    ${locator_loginlink}    5s
    Click Element    ${locator_loginlink}

Input data for login system pass
    Wait Until Element Is Visible    ${locator_username}    5s
    Input Text                       ${locator_username}    50011210180
    Input Text                       ${locator_password}    1409900420611
    Click Element                    ${locator_btnlogin}
    
Logout system
    Wait Until Element Is Visible    ${locator_username}    5s
    Input Text                       ${locator_username}    50011210180
    Input Text                       ${locator_password}    1409900420611
    Click Element                    ${locator_btnlogin}
    Click Element                    ${locator_btnlogout}

*** Test Cases ***
TC000-Open Web Page
    Open Web Browser
    Close Browser

TC001-Login Page
    Open Web Browser
    Default Login Page
    Wait Until Page Contains    กรุณาป้อนรหัสประจำตัวและรหัสผ่าน    5s
    Close Browser

TC002-Login System
    Open Web Browser
    Default Login Page
    Input data for login system pass
    Wait Until Element Is Visible   ${locator_popup_afterlogin}    5s
    Click Element                    ${locator_close_popup}
    Wait Until Page Contains    ยินดีต้อนรับเข้าสู่ระบบบริการการศึกษา    5s
    Close Browser

TC003-Logout System
    Open Web Browser
    Default Login Page
    Input data for login system pass
    Wait Until Element Is Visible    ${locator_popup_afterlogin}    5s
    Click Element                    ${locator_close_popup}
    Wait Until Page Contains    ยินดีต้อนรับเข้าสู่ระบบบริการการศึกษา    5s
    Click Element                    ${locator_btnlogout}
    Wait Until Page Contains         ประชาสัมพันธ์    5s
    Close Browser


