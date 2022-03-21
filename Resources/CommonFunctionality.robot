*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Start testCase
  Open Browser  http://rental14.infotiv.net/webpage/html/gui/index.php  ${BROWSER}
  Maximize Browser Window

Finish testCase
  close browser