*** Settings ***
Documentation   Order Robot on Robot Spare Bin Industries.
Library         RPA.Browser
Library         RPA.HTTP    # To use Download Functionality
Variables       variables/variables.py
Resource        resource/excel.robot


*** Keywords ***
Download Orders File From Website
    # Download Orders.csv File and Close Chrome
    Download    ${Web URL}${File Name}   overwrite=True

*** Keywords ***
Open Order Robots Website
    Open Available Browser    ${Web URL}${Robot Orders}
    Maximize Browser Window

*** Tasks ***
Order Robot Spare Bin Industries
    # perform below Tasks
    Download Orders File From Website
    Open Order Robots Website
    Read Orders Excel File 
    [Teardown]  Close Browser
