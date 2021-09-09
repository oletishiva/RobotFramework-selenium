*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}      https://www.powerbuy.co.th/th
${BROWSER}          chrome

*** Keywords ***

Start TestCase
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

Finish TestCase
   Close Browser