*** Settings ***
Documentation   Template robot main suite.
Library         RPA.Tables
Variables       variables/variables.py

*** Keywords ***
Read Orders Excel File 
    ${Orders Data} =  Read Table From Csv   ../${File Name}  header=True
    FOR    ${Order}    IN    @{Orders Data}
    Log    ${Order}[Address]
    END




