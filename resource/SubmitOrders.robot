*** Settings ***
Documentation       Fill Orders Robot Form
Library             RPA.Browser
Variables           variables/variables.py
Library             functions/functions.py

*** Keywords ***
ByPass Popup Message
    # By Pass Popup Message at the Start
    Wait Until Page Contains Element    ${Popup Window}    ${D Medium}
    Click Element   ${Popup Ok Button}

*** Keywords ***
Fill The Form to Order Robot
    # Use ${Order} as Argument to this function
    [Arguments]   ${Order}
    
    # return xpath string from lambda function - functions/functions.py
    ${Data S}=    Body Data   ${Order}[Body]
    [Return]    ${Data S}
    
    # By pass popup message - every time user submits form
    ByPass Popup Message

    # Fill Up form
    Wait Until Page Contains Element    ${Order Robot Identifer}   ${D Medium}
    Select From List By Value    ${Head}    ${Order}[Head]  
    Click Element    ${Data S}
    Input Text    ${Legs}    ${Order}[Legs]
    Input Text    ${Address}    ${Order}[Address]
    Click Button    ${Order First}
    Sleep    ${D Small}
    Click Button    ${Order Another}


