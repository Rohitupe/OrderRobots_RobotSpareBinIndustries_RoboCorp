*** Settings ***
Documentation   Template robot main suite.
Library     RPA.Tables

*** Keywords ***
Read Orders Excel File 
    ${Orders Data} =  Read Table From Csv   ../orders.csv  header=True
    FOR    ${Order}    IN    @{Orders Data}
    Log    ${Order}[Address]
    END




