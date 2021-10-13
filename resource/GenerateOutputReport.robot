*** Settings ***
Documentation       Generate Output Reports
Library             RPA.Browser
Variables           variables/variables.py
Library             RPA.PDF

*** Keywords ***
get text from page
    # get receipt details and Log them in output
    ${optext}=  Get Text    ${Receipt id}
    Html To Pdf    ${optext}    ${CURDIR}${/}output${/}file.pdf
    Screenshot   ${Robot}    ${CURDIR}${/}output${/}file.png
    ${Image}=  Create List      ${optext}    ${CURDIR}${/}output${/}file.png
    Add Files To Pdf    ${Image}    ${CURDIR}${/}output${/}file.pdf 
