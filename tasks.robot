*** Settings ***
Documentation   Order Robot on Robot Spare Bin Industries.
Library         RPA.Browser
Library         RPA.HTTP    # To use Download Functionality
Variables       variables/variables.py
Resource        resource/excel.robot
Resource        resource/zipoutput.robot
Library         RPA.Robocorp.Vault
Library         functions/functions.py


*** Variables ***
${File Path}    ${CURDIR}

*** Keywords ***
Download Orders File From Website
    # Download Orders.csv File and Close Chrome
    Download    ${Website URL}${File Name}   overwrite=True

*** Keywords ***
Open Order Robots Website
    Open Available Browser    ${Website URL}${Robot Orders}
    Maximize Browser Window

*** Tasks ***
Order Robot Spare Bin Industries
    # perform below Tasks
    Download Orders File From Website
    Open Order Robots Website
    Read Orders Excel File      ${File Path}
    Close Browser
    Ask user Zip Folder Name    ${File Path}
    [Teardown]  Close Browser
