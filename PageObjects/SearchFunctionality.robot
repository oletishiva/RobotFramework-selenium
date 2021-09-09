*** Settings ***
Library           SeleniumLibrary
Library    Collections
Resource          CartDetails.robot

*** Variables ***
${SearchInputTextbox}  id=txt-searchBox-input
${SearchItemsButton}  xpath://*[@id="btn-searchBox-input"][1]
${ProductItesmsFilter}       //div[@class='CardBody__Body-sc-1xt43yy-0 gwyEQW']
${lnk-viewBreadcrumb}  id=lnk-viewBreadcrumb-undefined
${44-55INCHES}     //*[text()='44 - 55 นิ้ว']/ancestor::div[@class="Row__Wrapper-v6uxgu-0 kSLyDU"][1]//*[@data-testid='btn-checkbox']
${32-43INCHES}     //*[text()='32 - 43 นิ้ว']/ancestor::div[@class="Row__Wrapper-v6uxgu-0 kSLyDU"][1]//*[@data-testid='btn-checkbox']
${FirstItemFromReturnList}  (//div[@class="ProductGridItem__Label-iQRkAY jLwkyu"]/parent::div/parent::div/parent::div)[1]
${LoadingIndicator}   //div[@class='LoadingScreen__Relative-buBEEi bfqcdg']
@{AddedItemToCart}=  Create List


*** Keywords ***

Search Product
    [Arguments]  ${Keyword}
    Input Text  ${SearchInputTextbox}  ${Keyword}  timeout=20s
    Wait For Condition    return document.readyState=="complete"
    Wait Until Element Is Enabled    ${SearchItemsButton}  timeout=10s
    Click Button  ${SearchItemsButton}
    Wait Until Element is Not Visible  ${LoadingIndicator}  timeout=20s
    Wait Until Element is visible  ${lnk-viewBreadcrumb}  timeout=10s

Filter Product 
    [Arguments]  ${ScreenSize}
    Wait Until Element is visible  ${ProductItesmsFilter}  timeout=10s
    Scroll Element Into View  ${ScreenSize}
    Wait Until Element is visible  ${ScreenSize}  timeout=10s
    Set Focus To Element  ${ScreenSize}
    Click Element  ${ScreenSize}
    Wait Until Element is Not Visible  ${LoadingIndicator}  timeout=30s

Add First Item Into The Cart
    [Arguments]  ${item}
    Wait Until Element is visible  ${item}  timeout=15s
    Set Focus To Element  ${item}
    ${data-productID}=  Get Element Attribute  ${item}  data-productid
    Log    data product id is ${data-productID}
    Click Element  ${item}
    Add item into cart
    Append To List  ${AddedItemToCart}  ${data-productID}
    Log  list items is ${AddedItemToCart}
