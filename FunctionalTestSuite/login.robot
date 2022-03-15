*** Settings ***
Resource   ../../Resources/CommonFunctionality.robot
Resource   ../../Resources/keywords.robot

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


*** Test Cases ***

loggIntoWebsite
  [Documentation]  This Test Case to Verifies That User Can Login
  [Tags]  Header
  logInUserAccount
  Verfiy User Information Field Will Change To View a Welcome Phrase
















