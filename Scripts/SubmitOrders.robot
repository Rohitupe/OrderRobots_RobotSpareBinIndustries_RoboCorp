*** Settings ***
Documentation       Fill Orders Robot Form
Library             RPA.Browser
Variables           variables/variables.py

*** Keywords ***
Fill The Form to Order Robot
    Wait Until Page Contains Element    xpath://select[@id="head"]/option[@value="2"]   ${Dmedium}
    Select From List By Value    id:head    2  
    Click Element    xpath://input[@id="id-body-6"]
    Input Text    //input[@type='number' and @class="form-control"]    23
    Input Text    id:address    Addresss1


