*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${url}                      https://aroidee.netlify.app/
${browser}                  chrome
${locator_email}            name=email
${locator_password}         name=password
${locator_signInBtn}        //*[@id="root"]/div[1]/form/button
${locator_btnLogin}         //*[@id="root"]/div[1]/div[1]/div/button
${locator_chk_box}          //*[@id="root"]/div[1]/form/div[3]/input
${locator_food_display}     //*[@id="food-display"]/div
${locator_closeLoginPage}   //*[@id="root"]/div[1]/form/div[1]/img
${locator_user_display}     //*[@id="root"]/div[1]/div[1]/div/div[3]/div/div/span

*** Keywords ***

Open Web Browser
    Set Selenium Speed      0.5s
    Open Browser            ${url}   ${browser}
    # Maximize Browser Window

Show Login Popup
    Click Element    ${locator_btnLogin}
    Wait Until Page Contains    Login  10s
    Click Element    ${locator_closeLoginPage}

Login System pass
    ${p}    Set Variable    12344321
    Wait Until Element Is Visible    ${locator_food_display}   10s
    Click Element    ${locator_btnLogin}
    Input Text    ${locator_email}    test@test.com
    Input Text    ${locator_password}    ${p}
    Click Element    ${locator_chk_box}
    Click Element    ${locator_signInBtn}

*** Test Cases ***
TC000-Show Defult Page
    Open Web Browser
    Wait Until Page Contains    Top dishes near you   10s
    Sleep    5s
    Close Window

TC001-Show Login Popup
    Open Web Browser
    Wait Until Page Contains    Top dishes near you   10s
    Show Login Popup
    Sleep    5s
    Close Window

TC002-Login System
    Open Web Browser
    Login System pass
    Wait Until Element Is Visible    ${locator_user_display}    10s
    Sleep    10s
    Close Window