*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://automate-test.stpb-digital.com/login/
${browser}        chrome
${locator_email}    id=email
${locator_password}    name=password
${locator_btnlogin}    id=btn-login
${locator_errmsg_email}    //*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_errmsg_password}    //*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[2]/p
${locator_hpl_createaccount}    //*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[4]/p[2]/a

*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.5s
    Open Browser    ${url}    ${browser}
    # Maximize Browser Window

Input data for login email pass
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    Beam1234@gmail.com
    Input Text    ${locator_password}    ${EMPTY}

Input data for login email fail
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    Beam1234gmail.com
    Input Text    ${locator_password}    ${EMPTY}

Input data for login password more than 5 digits
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    ${EMPTY}
    Input Text    ${locator_password}    1234567890
    Click Element    ${locator_btnlogin}

Input data for login password less than 5 digits
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    ${EMPTY}
    Input Text    ${locator_password}    123
    Click Element    ${locator_btnlogin}

Input data for login page pass
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locator_btnlogin}

Input data for login page fail
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    Beam1234@gmail.com
    Input Text    ${locator_password}    12345678900
    Click Element    ${locator_btnlogin}

Not input data in require field
    Wait Until Element Is Visible    ${locator_email}    5s
    Input Text    ${locator_email}    ${EMPTY}
    Input Text    ${locator_password}    ${EMPTY}
    Click Element    ${locator_btnlogin}

Check hyperlink create an account
    Click Element    ${locator_hpl_createaccount}

*** Test Cases ***
TC000-Show Defult Page
    Open Web Browser
    Wait Until Page Contains    Kru P' Beam    5s
    Close Browser

TC001-Input email pass
    Open Web Browser
    Input data for login email pass
    Wait Until Element Is Not Visible    ${locator_errmsg_email}    5s
    Close Browser

TC002-Input email fail
    Open Web Browser
    Input data for login email fail
    ${err_msg}=    Get Text    ${locator_errmsg_email}
    Should Be Equal As Strings    ${err_msg}    email must be a valid email
    Close Browser

TC003-Input password more than 5 digits
    Open Web Browser
    Input data for login password more than 5 digits
    Wait Until Element Is Not Visible    ${locator_errmsg_password}    5s
    Close Browser

TC004-Input password more less 5 digits
    Open Web Browser
    Input data for login password less than 5 digits
    ${err_msg}=    Get Text    ${locator_errmsg_password}
    Should Be Equal As Strings    ${err_msg}    password must be at least 5 characters
    Close Browser

TC005-Web login pass
    Open Web Browser
    Input data for login page pass
    Wait Until Page Contains    Search Filters    5s
    Close Browser

TC006-Web login fail
    Open Web Browser
    Input data for login page fail
    ${err_msg}=    Get Text    ${locator_errmsg_email}
    Should Be Equal As Strings    ${err_msg}    Email or Password is invalid
    Close Browser

TC007-Check require field
    Open Web Browser
    Not input data in require field
    ${err_msg}=    Get Text    ${locator_errmsg_email}
    Should Be Equal As Strings    ${err_msg}    email is a required field
    Close Browser

TC008-Click Hyperlink Create an account
    Open Web Browser
    Wait Until Element Is Visible    ${locator_hpl_createaccount}    5s
    Check hyperlink create an account
    Wait Until Page Contains    Kru P' Beam    5s
    Close Browser