*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${url}                  https://aroidee.netlify.app/
${browser}              chrome
${locator_email}        id=username
${locator_password}     id=password
${locator_btnLogin}     id=kc-login

*** Keywords ***

Open Web Browser
    Set Selenium Speed      0.5s
    Open Browser            ${url}   ${browser}
    Maximize Browser Window

Login System pass
    ${p}    Set Variable    12344321
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    pakorn.soikham@gmail.com
    Input Text    ${locator_password}    ${p}
    Click Element    ${locator_btnLogin}

*** Test Cases ***
# Test open browser
#     Open Web Browser
#     Wait Until Page Contains    Sign in with Thai MOOC
#     Close Browser

Login System
    Open Web Browser
    Login System pass
    Wait Until Page Contains    หลักสูตรของฉัน    5s
    Close Window