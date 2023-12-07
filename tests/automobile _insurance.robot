*** Settings ***
Resource          ../resources.robot
Resource          ../pages/automobile_insurance_page.robot

Test Setup        Open Main Page Using Chrome Browser
Test Teardown     Close Browser

*** Test Cases ***
Fill out the insurance form and validate the success message
    When the user fills in the vehicle data
    And fills in the insurant data
    And fills in the product data
    And the user choose a price option
    And fills in the insurant data and send a quote

