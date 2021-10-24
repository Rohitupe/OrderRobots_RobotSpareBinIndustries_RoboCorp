*** Settings ***
Documentation   Zip all the PDF in the output folder
Library         RPA.Dialogs
Library         RPA.Archive
Library         RPA.FileSystem
#Library         OperatingSystem

*** Keywords ***
Ask user Zip Folder Name
    [Arguments]    ${File Path}
    Add heading    Zip Folder Name
    Add text input    name    placeholder=Enter Folder Name Here
    ${File Name}=    Run dialog
    Archive Folder With Zip    ${File Path}${/}output${/}pdf${/}    ${File Name.name}.zip
    Move File   ${File Path}${/}${File Name.name}.zip     ${File Path}${/}output${/}${File Name.name}.zip    overwrite=True
    Remove Directory    ${File Path}${/}output${/}pdf${/}   recursive=True

