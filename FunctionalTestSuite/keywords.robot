*** Settings ***
Library  SeleniumLibrary
Library    DateTime

*** Keywords ***
logInUserAccount
  Input Text   ${"email_test"}  Test1234@gmail.com
  Sleep  1 second
  Input Text   ${txtbox_password}  test1234
  Sleep  2seconds
  Click Button  //*[@id="login"]
  Sleep  1 second

Verfiy User Information Field Will Change To View a Welcome Phrase
  Wait Until Page Contains  You are signed in as test1234
  Element should be visible  //*[@id="logout"]
  Sleep  1 seconds

Verify login Fails With The Wrong Email
  Input Text   ${"email_test"}  Test12@gmail.com
  Sleep  1 second
  Input Text   ${txtbox_password}  test1234
  Sleep  2seconds
  Click Button  //*[@id="login"]
  Sleep  1 seconds
VerfiyErrorMessageShow
  Element Should Contain  ${txt_error}  Wrong e-mail or password

Login Should Fails With Wrong Password
  Input Text   ${"email_test"}  Test1234@gmail.com
  Sleep  1 second
  Input Text   ${txtbox_password}  test123
  Sleep  2seconds
  Click Button  //*[@id="login"]
  Sleep  1 seconds

Login Should Fails With Wrong PassWord and wrongEmail
   Input Text   ${"email_test"}  Test12gmail.com
   Sleep  1 second
   Input Text   ${txtbox_password}  test1235
   Sleep  1 second
   Click Button  //*[@id="login"]
   Sleep  1 seconds

Verify login Fails With Blank Password
  Input Text   ${"email_test"}  Test1234@gmail.com
  Sleep  2seconds
  Click Button  //*[@id="login"]

Verfiy That If The Password Is Not Filled The Pop-Up Alert Is Shown Not Emplty
  Should Not Be Empty  ${password_popup_alert}
  Sleep  1 seconds

Confirm login Fails With Blank Email
  Input Text   ${txtbox_password}  test1235
  Sleep  2seconds
  Click Button  //*[@id="login"]

Verfiy that if the Email is not filled the pop-up alert is shown not emplty
  Should Not Be Empty  ${email_popup_alert}
  sleep  2seconds

Confirm login Fails With Blank Email and Blank Password
  Input Text   ${txtbox_password}  ${EMPTY}
  Sleep  2seconds
  Input Text   ${"email_test"}  ${EMPTY}
  Sleep  2seconds
  Click Button  //*[@id="login"]

Verfiy that if the Email is not filled and the password not filled the pop-up alert is shown not emplty
   Should Not Be Empty  ${email_popup_alert}
   Should Not Be Empty  ${password_popup_alert}
   Sleep  2seconds

User Can cancel Booking Of A Car
  Click Button  //*[@id="mypage"]
  Sleep  2seconds
  Wait Until Page Contains  You are signed in as test1234
  Click Button   //*[@id="unBook1"]
  Sleep  2seconds
  Alert Should be present  are you sure you want cancel Order No: 28??  ACCEPT  None
  Sleep   3seconds
  Wait Until Page Contains  Your car: BBE465 has been Returned
  Sleep   4seconds


Choose Current Date and Continue
    Page Should Contain Element   //*[@id="questionText"]
    Sleep  2s
    ${CurrentDate}    Get Current Date    result_format=%d-%m-%Y
    Sleep  2s
    Click Button    //*[@id="continue"]
    Sleep  2s
    Page Should Contain Element   //*[@id="questionText"]
 ${DELAY}

Choose The Car Type
    Click Element  id:filterMakeHolder
    Sleep  3s
    Click Element  //*[@id="ms-opt-1"]
    Sleep  3s

Choose The Number Of Pessanger Sex
    Click Element  id:filterPassHolder
    Sleep  3s
    Click Element   id:ms-opt-7
    Sleep  3s
Verfiy The Results Of Selecting Unavilable Option Is Unavilable
  Wait Until Page Contains   No cars with selected filters. Please edit filter selection


Choose The Number Of Pessanger Two and Book The First Car In The List
    Click Element  id:filterPassHolder
    Sleep  3s
    Click Element   id:ms-opt-5
    Sleep  3s
    Click Element  id:filterPassHolder
    sleep  3s
    Page Should Contain Button   //*[@id="carSelect1"]
    Click button  //*[@id="carSelect1"]
    Sleep  3s

Confirm Booking Credit Card Detailed Page Contains
  Wait Until Page Contains  Confirm booking of Audi TT

Fill The Credit Card Info
  Input Text   //*[@id="cardNum"]   1234567890123456
  Sleep  1 second
  Input Text   //*[@id="fullName"]  Brad Pitt
  Sleep  2seconds
  Click Element  //*[@id="confirmSelection"]/form/select[1]
  Sleep  3s
  Click Element  //*[@id="month1"]
  Sleep  3s
  Click Element  //*[@id="confirmSelection"]/form/select[2]
  Sleep  3s
  Click Element  //*[@id="month2022"]
  Sleep  3s
  Input Text  //*[@id="cvc"]   456
  Sleep  3s
  Click Button  //*[@id="confirm"]
  Sleep  1 second

Confirm your car is booked
  Wait Until Page Contains    A Audi TT is now ready for pickup


















