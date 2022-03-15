*** Settings ***
Resource   ../../Resources/CommonFunctionality.robot
Resource   ../../Resources/keywords.robot

Test Setup   CommonFunctionality.Start testCase
Test Teardown   CommonFunctionality.Finish testCase

*** Variables ***
${browser}  chrome
${url}  http://rental14.infotiv.net/
${"email_test"}  //*[@id="email"]
${email_popup_alert}  //*[@id="email"]  Please fill out this field.
${txtbox_password}  //*[@id="password"]
${password_popup_alert}  //*[@id="password"]  Please fill out this field.
${txt_error}  //*[@id="signInError"]



*** Test Cases ***

Verify login Fails With The Wrong Email
  [Documentation]  This Test Case to Verifies That User Fail to Login With Wrong Email
  [Tags]  Header
  Verify login Fails With The Wrong Email
  VerfiyErrorMessageShow

Login Should Fails With Wrong Password
  [Documentation]   This Test Case to Verifies That User Fail to Login With Wrong Password
  [Tags]  Header
  login should fails with wrong PassWord
  VerfiyErrorMessageShow

Login Should Fails With Wrong PassWord and wrongEmail
  [Documentation]  This Test Case to Verifies That User Fail to Login With Wrong Password and WrongEmail
  [Tags]  Header
  Login Should Fails with Wrong Password and WrongEmail
  VerfiyErrorMessageShow


Verify login Fails With Blank Password
  [Documentation]  This Test Case To Verifies That User Fail to Login With Empty Password and the Pop-up alrert "Fill In This Field" is shown
  [Tags]  Header
  Verify login Fails With Blank Password
  Verfiy That If The Password Is Not Filled The Pop-Up Alert Is Shown Not Emplty

Confirm login Fails With Blank Email
  [Documentation]  This Test Case to Verifies That User fail to login With Empty Email and the Pop-Up alrert "Fill In This Field" is shown
  [Tags]  Header
  Confirm login Fails With Blank Email
  Verfiy That If The Email Is Not Filled The Pop-Up Alert Is Shown Not Emplty

Confirm login Fails With Blank Email and Blank Password
  [Documentation]  This test case to verifies that user fail to log in with empty Email and empty password and the Pop-up alrert "Fill In This Field" is shown
  [Tags]  Header
  Confirm login Fails With Blank Email and Blank Password
  Verfiy That If The Email Is Not Filled and The Password Not Filled The Pop-Up Alert Is Shown Not Emplty