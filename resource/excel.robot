*** Settings ***
Documentation   Template robot main suite.
Library         RPA.Tables
Variables       variables/variables.py
Resource        resource/SubmitOrders.robot

*** Keywords ***
Read Orders Excel File
    # Read Orders.csv and pass the Table variable as argument to Fill the Form
    ${Orders Data} =  Read Table From Csv   ${File Name}  header=True
    FOR    ${Order}    IN    @{Orders Data}
        Fill The Form to Order Robot    ${Order}
        #Reload Page
        #Wait Until Keyword Succeeds    3    1    Fill The Form to Order Robot   ${Order}      
    END
