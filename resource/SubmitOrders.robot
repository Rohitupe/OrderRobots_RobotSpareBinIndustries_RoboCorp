*** Settings ***
Documentation       Fill Orders Robot Form
Library             RPA.Browser
Variables           variables/variables.py
Library             functions/functions.py
Resource            resource/GenerateOutputReport.robot

# +
*** Keywords ***
ByPass Popup Message
    # By Pass Popup Message at the Start
    Wait Until Page Contains Element    ${Popup Window}    ${D Medium}
    Click Element   ${Popup Ok Button}
    
Wait Until It get Success
    [Arguments]   ${KW}   ${KWARGS}  ${Data}
    Press Keys   None   CTRL+SHIFT+R
    Reload Page
    Wait Until Keyword Succeeds    30s   3s   ${KW}   ${KWARGS}  ${Data}
# -

*** Keywords ***
Fill The Form to Order Robot
    # Use ${Order} as Argument to this function
    [Arguments]   ${Order}
    
    # return xpath string from lambda function - functions/functions.py
    ${Data S}=    Body Data   ${Order}[Body]
    [Return]    ${Data S}    
    
    Wait Until It get Success    Fill Form     ${Order}     ${Data S}

# +
*** Keywords ***
Fill Form
    [Arguments]   ${Order}  ${Data S}
    
    # Reload page
    Press Keys   None   CTRL+SHIFT+R
    Reload Page
    
    # By pass popup message - every time user submits form
    ByPass Popup Message
    
    # Fill Up form
    Wait Until Page Contains Element    ${Order Robot Identifer}   ${D Medium}
    Select From List By Value    ${Head}    ${Order}[Head]  
    Click Element    ${Data S}
    Input Text    ${Legs}    ${Order}[Legs]
    Input Text    ${Address}    ${Order}[Address]
    Click Button    ${Preview Button}
    Wait Until Page Contains Element    ${Preview Image}    ${D Large}
    Click Button    ${Order First}
    Wait Until Page Contains Element    ${Receipt Xpath}    ${D Small}

Get Output Result
    [Arguments]    ${Count}    ${File Path}
    get text from page   ${Count}    ${File Path}
    Click Button    ${Order Another}
