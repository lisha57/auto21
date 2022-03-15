*** Settings ***

Documentation     A test to invalid login.
...
...               These tests are data-driven.use a Test Template setting,

...                that is called with different arguments to cover different scenarios.


Resource   ../../Resources/CommonFunctionality.robot
Resource   ../../Resources/keywords.robot


Test Setup   CommonFunctionality.Start testCase
Test Teardown   CommonFunctionality.Finish testCase
Test Template   Invalid login Scenarios

*** Variables ***
${browser}  chrome
${url}  http://rental14.infotiv.net/
${"email_test"}  //*[@id="email"]
${email_popup_alert}  //*[@id="email"]  Please fill out this field.
${txtbox_password}  //*[@id="password"]
${password_popup_alert}  //*[@id="password"]  Please fill out this field.
${txt_error}  //*[@id="signInError"]
${DELAY}   3seconds

*** Test Cases ***                                    EMAIL              PASSWORD
Verify Login Fails-Blank Email and Blank Password     ${EMPTY}            ${EMPTY}
Verify Login Fails-Blank Email                        ${EMPTY}             test1234
Verify Login Fails-Blank Password                    test1234@gmail.com   ${EMPTY}
Verify Login Fails-Wrong Email                       Test12@gmail.com    test1234
Verify Login Fails-Wrong Password                    test1234@gmail.com  test123
Verify Login Fails-Wrong Password and Wrong Password  Test12gmail.com     test1235

*** Keywords ***
 Invalid login Scenarios
    [ARGUMENTS]   ${Email}   ${Password}
    Input Text    ${"email_test"}    ${Email}
    Input Text   ${txtbox_password}    ${Password}
    Click Button  //*[@id="login"]
    Sleep  2s
    Login Should Have Failed

Login Should Have Failed
   Location Should Be  http://rental14.infotiv.net/




