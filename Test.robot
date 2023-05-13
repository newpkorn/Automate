*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${btnlogin}

*** Test Cases ***
Test open browser
    Set Selenium Speed     0.5s
    Open Browser    https://lms.thaimooc.org/    chrome
    Maximize Browser Window
    Click Button   <a class="sign-in-btn btn" href="/auth/login/common-oauth2-backend/">เข้าสู่ระบบ</a>