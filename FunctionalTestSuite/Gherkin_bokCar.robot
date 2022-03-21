*** Settings ***
Documentation     A test suite with Gherkin style test.
...               This suite to test navigations-flödet av att boka en bil
Resource   ../../Resources/CommonFunctionality.robot
Resource   ../../Resources/keywords.robot

Test Teardown   CommonFunctionality.Finish testCase


*** Variables ***
${browser}  chrome
${browser}  headlesschrome
${url}  http://rental14.infotiv.net/
${"email_test"}  //*[@id="email"]
${email_popup_alert}  //*[@id="email"]  Please fill out this field.
${txtbox_password}  //*[@id="password"]
${password_popup_alert}  //*[@id="password"]  Please fill out this field.
${txt_error}  //*[@id="signInError"]
${DELAY}   3seconds

*** Test Cases ***
user Should submitt his credit card inorder to book a car
    [tags]  Smoke
    Given browser is opened to login page
    And user login With Email and Password
    And user Choose Current Date and Continue
    And user Choose The Car Typ
    And user Choose The Number Of Pessanger Two and Book The First Car in The List
    And user Confirm Booking Credit Card Detailed Page Contains
    when user Fill The Credit Card Info
    Then user recive Confirmation that his car is booked

*** Keywords ***
Browser is opened to login page
   Open Browser  ${url}  ${browser}
  Maximize Browser Window

user login With Email and Password
  logInUserAccount

user Choose Current Date and Continue
  Choose Current Date and Continue

user Choose The Car Typ
   Choose The Car Type

user Choose The Number Of Pessanger Two and Book The First Car in The List
   Choose The Number Of Pessanger Two and Book The First Car In The List

user Confirm Booking Credit Card Detailed Page Contains
  Confirm Booking Credit Card Detailed Page Contains


user Fill The Credit Card Info
    Fill The Credit Card Info

user recive Confirmation that his car is booked
  Confirm your car is booked