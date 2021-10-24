*** Settings ***
Documentation       Generate Output Reports
Library             RPA.Browser
Variables           variables/variables.py
Library             RPA.PDF
Library             functions/generatePDF.py
Library             RPA.FileSystem

*** Keywords ***
get text from page
    [Arguments]   ${Count}    ${File Path}
    # get receipt details and Log them in output
    ${Receipts}=    Get Text    ${Receipt Xpath}
    ${title}=   Get Text    ${Receipt Title}
    ${datetime}=   Get Text    ${Receipt Datetime}
    ${id}=   Get Text    ${Receipt id}
    ${address}=   Get Text    ${Receipt Address}
    ${order}=   Get Text    ${Receipt Order}
    ${note}=  Get Text    ${Receipt Note}
    Screenshot   ${Robot}    ${File Path}${/}output${/}pdf${/}file.png
    
    ${Receipt}=   Create List   
            ...  ${title}
            ...  ${datetime}     
            ...  ${id}   
            ...  ${address}  
            ...  ${order}    
            ...  ${note}
            ...  ${File Path}${/}output${/}pdf${/}file.png
    
    PDF Generation    ${Receipt}    ${Count}    ${File Path}${/}output${/}pdf${/}
