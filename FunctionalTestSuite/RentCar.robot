*** Settings ***
Resource   ../../Resources/CommonFunctionality.robot
Resource   ../../Resources/keywords.robot
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


*** Test Cases ***

Choose Date and Continue
  [Documentation]  Valid date input with pressing continue buttom will go to next page
  [Tags]  DataSelection
  Choose Current Date and Continue

Check Selection Of Unavilable Option
  [Documentation]  if no car match the selection nummber of pessangers in filter ,a message should ask the user to try a different selection
  [Tags]  CarSelection
  Choose Current Date and Continue
  Choose The Car Type
  Choose The Number of Pessanger Sex
  Verfiy The Results of Selecting Unavilable Option Is Unavilable

Check Alert Message To login Should Pop Up After Select Book Button
  [Documentation]  if user not signed in should alert pop up after pres book button
  [Tags]  CarSelection
  Choose Current Date and Continue
  Choose The Car Type
  Choose The Number Of Pessanger Two and Book The First Car In The List
  Alert Should Be Present  You need to be logged in to continue.

Book A Car
  [Documentation]  this case to vertify that user can bok a car from the sign till see the booking in the user page
  [Tags]   VG_test
  logInUserAccount
  Choose Current Date and Continue
  Choose The Car Type
  Choose The Number Of Pessanger Two and Book The First Car in The List
  Confirm Booking Credit Card Detailed Page Contains
  Fill The Credit Card Info
  Confirm your car is booked
  Wait Until Page Contains    A Audi TT is now ready for pickup