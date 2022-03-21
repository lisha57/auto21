*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Start testCase
  Open Browser  ${url}  ${browser}
  Maximize Browser Window

Finish testCase
  close browser