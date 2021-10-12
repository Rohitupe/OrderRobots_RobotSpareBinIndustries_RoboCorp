*** Settings ***
Documentation       Generate Output Reports
Library             RPA.Browser
Variables           variables/variables.py

*** Keywords ***
get text from page
    # get receipt details and Log them in output
    ${optext}=  Get Text    ${Receipt}
    Log   ${optext}



