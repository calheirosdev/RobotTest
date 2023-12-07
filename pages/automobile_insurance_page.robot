*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${JSON_DATA}    dados/data.json

*** Keywords ***
the user fills in the vehicle data
    ${dados} =    Get File    ${JSON_DATA}
    ${dados_dict} =    Evaluate    json.loads('''${dados}''')    json
    Select From List By Value    id=make    ${dados_dict['vehicle_data']['make']}
    Input Text    id=dateofmanufacture    ${dados_dict['vehicle_data']['dateofmanufacture']}
    Select From List By Value    id=model    ${dados_dict['vehicle_data']['model']}
    Input Text    id=cylindercapacity    ${dados_dict['vehicle_data']['cylindercapacity']}
    Input Text    id=payload    ${dados_dict['vehicle_data']['payload']}
    Input Text    id=totalweight    ${dados_dict['vehicle_data']['totalweight']}
    Input Text    id=engineperformance    ${dados_dict['vehicle_data']['engineperformance']}
    Select From List By Value    id=numberofseats    ${dados_dict['vehicle_data']['numberofseats']}
    Select From List By Value    id=numberofseatsmotorcycle    ${dados_dict['vehicle_data']['numberofseatsmotorcycle']}
    Select From List By Value    id=fuel    Gas   ${dados_dict['vehicle_data']['fuel']}
    Input Text    id=listprice    20000   ${dados_dict['vehicle_data']['listprice']}
    Input Text    id=annualmileage    10000  ${dados_dict['vehicle_data']['annualmileage']}
    Click Element  id=enterinsurantdata

fills in the insurant data
    ${dados} =    Get File    ${JSON_DATA}
    ${dados_dict} =    Evaluate    json.loads('''${dados}''')    json
    Input Text    id=firstname    ${dados_dict['insurant_data']['first_name']}
    Input Text    id=lastname    ${dados_dict['insurant_data']['last_name']}
    Input Text    id=birthdate    ${dados_dict['insurant_data']['birth']}
    Execute JavaScript    document.getElementById('${dados_dict['insurant_data']['gender']}').click();
    Input Text    id=streetaddress    ${dados_dict['insurant_data']['street_address']}
    Select From List By Value    id=country    ${dados_dict['insurant_data']['country']}
    Input Text    id=zipcode    ${dados_dict['insurant_data']['zip']}
    Input Text    id=city    ${dados_dict['insurant_data']['city']}
    Select From List By Value    id=occupation    ${dados_dict['insurant_data']['occupation']}
    Execute JavaScript    document.getElementById('${dados_dict['insurant_data']['hobbies']}').click();
    Click Element   id=nextenterproductdata

fills in the product data
    ${dados} =    Get File    ${JSON_DATA}
    ${dados_dict} =    Evaluate    json.loads('''${dados}''')    json
    Input Text    id=startdate    ${dados_dict['product_data']['start_data']}
    Select From List By Value    id=insurancesum    ${dados_dict['product_data']['sum']}
    Select From List By Value    id=meritrating    ${dados_dict['product_data']['bonus']}
    Select From List By Value    id=damageinsurance    ${dados_dict['product_data']['damage']}
    Execute JavaScript    document.getElementById('${dados_dict['product_data']['optional_product']}').click();
    Select From List By Value    id=courtesycar    ${dados_dict['product_data']['courtesy']}
    Click Element   id=nextselectpriceoption

the user choose a price option
    ${dados} =    Get File    ${JSON_DATA}
    ${dados_dict} =    Evaluate    json.loads('''${dados}''')    json
    Wait Until Element Is Visible    xpath=//span[@id='selectsilver_price']
    ${silver_price}    Get Text    xpath=//span[@id='selectsilver_price']
    ${gold_price}      Get Text    xpath=//span[@id='selectgold_price']
    ${platinum_price}  Get Text    xpath=//span[@id='selectplatinum_price']
    ${ultimate_price}  Get Text    xpath=//span[@id='selectultimate_price']

    Log Many    Silver Price: ${silver_price}    GOLD Price: ${gold_price}    Platinum Price: ${platinum_price}    Ultimate Price: ${ultimate_price}
    Execute JavaScript    document.getElementById('selectgold').click();
    Log Many   GOLD Price ${gold_price} was chosen by user
    Wait Until Element Is Visible  id=nextsendquote
    Click Element   id=nextsendquote

fills in the insurant data and send a quote
    ${dados} =    Get File    ${JSON_DATA}
    ${dados_dict} =    Evaluate    json.loads('''${dados}''')    json
    Wait Until Page Contains Element  id=email
    Input Text    id=email    ${dados_dict['send_quote']['email']}
    Input Text    id=username    ${dados_dict['send_quote']['username']}
    Input Text    id=password    ${dados_dict['send_quote']['password']}
    Input Text    id=confirmpassword    ${dados_dict['send_quote']['password']}
    Input Text    id=Comments    ${dados_dict['send_quote']['comments']}
    Click Element   id=sendemail
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    xpath=//h2[contains(text(),'Sending e-mail success!')]