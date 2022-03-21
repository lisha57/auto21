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
User Can Cancel Booking Of a Car
  [Documentation]  This test case to verifies that user can cancel booking of a car by pressing a button for unbooking car
  [Tags]  MYPage
  logInUserAccount
  User Can Cancel Booking Of A Car