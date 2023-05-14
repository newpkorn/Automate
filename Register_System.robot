*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                 http://localhost/register_system/
${browser}             gc
${locator_username}    name=username
${locator_password}    name=password
${locator_btnlogin}    name=login_user
# ${locator_err_login}   css=<h3>Wrong username or password. Please try again.</h3>

*** Keywords ***
Open web browser
    Set Selenium Speed     0.5s
    Open Browser        ${url}    ${browser}
    Maximize Browser Window

Input data for login page pass
    Wait Until Element Is Visible    ${locator_username}
    Input Text        ${locator_username}    Test
    Input Text        ${locator_password}    12345678
    Click Element     ${locator_btnlogin}

Input data for login page fail
    Wait Until Element Is Visible    ${locator_username}
    Input Text        ${locator_username}    Test
    Input Text        ${locator_password}    1234567890
    Click Element     ${locator_btnlogin}

*** Test Cases ***
TC001-Defult page
    Open web browser
    Wait Until Page Contains    Login    5s
    Close Browser

TC002-login page pass
    Open Web Browser
    Input data for login page pass
    Wait Until Page Contains    You are now loged in    10s
    Close Browser

TC003-login fail
    Open web browser
    Wait Until Element Is Visible    ${locator_username}    5s
    Input data for login page fail
    # ${errmsg}=    Get Text    ${locator_err_login}
    Wait Until Page Contains   Wrong username or password. Please try again.    5s
    Close Browser