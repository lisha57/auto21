*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Start testCase
  Open Browser    about:blank ${BROWSER}

  Maximize Browser Window

Finish testCase
  close browser