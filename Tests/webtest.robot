*** Settings ***
Library  SeleniumLibrary

Library    DateTime

Test Setup  Start testCase


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
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To  http://rental14.infotiv.net/
    Wait Until Page Contains  Infotiv Car Rental
End Web Test
    Close Browser

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