*** Settings ***
Library  SeleniumLibrary

Library    DateTime

Test Setup  Start testCase

Test Teardown  Finish testCase

*** Variables ***
${browser}  chrome
${url}  http://rental14.infotiv.net/
${"email_test"}  //*[@id="email"]
${email_popup_alert}  //*[@id="email"]  Please fill out this field.
${txtbox_password}  //*[@id="password"]
${password_popup_alert}  //*[@id="password"]  Please fill out this field.
${txt_error}  //*[@id="signInError"]
${DELAY}   3seconds
${value}  //*[@id="start"]   value
*** Keywords ***
Start testCase
  Open Browser  ${url}  ${browser}
  Maximize Browser Window

Finish testCase
  close browser

Choose Current Date and Continue
    Page Should Contain Element   //*[@id="questionText"]
    Sleep  2s
    ${CurrentDate}    Get Current Date    result_format=%d-%m-%Y
    Sleep  2s
    Click Button    //*[@id="continue"]
    Sleep  2s
    Page Should Contain Element   //*[@id="questionText"]
 ${DELAY}


*** Test Cases ***

Choose Date and Continue
  [Documentation]  Valid date input with pressing continue buttom will go to next page
  [Tags]  DataSelection
  Choose Current Date and Continue