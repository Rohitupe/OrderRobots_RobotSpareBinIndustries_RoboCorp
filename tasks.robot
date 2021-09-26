*** Settings ***
Documentation   Order Robot on Robot Spare Bin Industries.
Library         RPA.Browser
Library         RPA.HTTP    # To use Download Functionality
Variables       variables/variables.py
Resource         Scripts/excel.robot


*** Keywords ***
Download Orders File From Website
    # Download Orders.csv File and Close Chrome
    Download    ${WebURL}${File Name}   overwrite=True

# +
*** Keywords ***
Open Order Robots Website
    Open Available Browser    ${WebURL}${Robot Orders}
    Maximize Browser Window
    
ByPass Popup Message
    Wait Until Page Contains Element    xpath://div[@class="modal-header"]    ${Dmedium}
    Click Element   xpath://div[@class="alert-buttons"]/button[1]
# -
*** Tasks ***
Order Robot Spare Bin IND
    Download Orders File From Website
    Open Order Robots Website
    ByPass Popup Message
