*** Settings ***
Library           SeleniumLibrary
Library  DateTime
Library  BuiltIn

*** Variables ***
${Cart}  //*[@id="btn-openMiniCart"]/img
${CartHeader}  //*[@class="Padding-sc-10o2jvk-0 jYpZwl"]
${CartItems}  //*[@data-product-section="Cart"]

*** Keywords ***

Checkout Cart
    Click Element  ${Cart}
    Wait Until Element is visible  ${CartHeader}  timeout=20s

Verify items in cart
    [Arguments]  ${AddedItemToCart}
    ${data-productID}=  Get Element Attribute  ${CartItems}  data-productid
    Log    data product id is ${data-productID}
    

