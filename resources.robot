*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MAIN_PAGE}      http://sampleapp.tricentis.com/101/app.php
${CHROME_DRIVER_PATH}    C:/chromedriver.exe

*** Keywords ***
Open Main Page Using Chrome Browser
  Open Browser    ${MAIN_PAGE}    chrome    executable_path=${CHROME_DRIVER_PATH}
  Maximize Browser Window
