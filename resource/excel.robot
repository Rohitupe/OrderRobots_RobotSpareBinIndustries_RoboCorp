*** Settings ***
Documentation   Template robot main suite.
Library         RPA.Tables
Variables       variables/variables.py
Resource        resource/SubmitOrders.robot
Library         RPA.FileSystem

*** Variable ***
${Count}    0

*** Keywords ***
Read Orders Excel File
    [Arguments]    ${File Path}
    # Read Orders.csv and pass the Table variable as argument to Fill the Form
    ${Orders Data} =  Read Table From Csv   ${File Name}  header=True
    FOR    ${Order}    IN    @{Orders Data}
        Fill The Form to Order Robot    ${Order}
        ${Count}=   Evaluate   ${Count} + 1
        Get Output Result   ${Count}   ${File Path}
    END
    Remove File     ${File Path}${/}output${/}pdf${/}file.png
