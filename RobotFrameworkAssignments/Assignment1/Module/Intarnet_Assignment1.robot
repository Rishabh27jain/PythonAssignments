*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     String
Test Setup      open the browser and login to intranet
Test Teardown   Close Browser
Library     Collections
Resource        ../Common_Files/Resource.robot
Resource        ../Common_Files/Variable.robot


*** Test Cases ***
Enter Name In Search Field

    input text          id:birds                       ${input_text}
    sleep               10
    Press Keys          id:birds                       ENTER
    ${elements}=  get element count    css:table.table-hover>tbody>tr:nth-child(n)
    #${data}=      get text             css:table.table-hover>tbody>tr:nth-child(1)>td:nth-child(2)
     FOR    ${i}    IN RANGE    ${elements}
        Exit For Loop If      '${i}' == '${elements}'
        ${n}=   Evaluate   ${i} +1
        ${name}       get text        css:table.table-hover>tbody>tr:nth-child(${n})>td:nth-child(2)
        Append To List    ${actuallist}       ${name}
        ${i}=  Evaluate   ${i} + 1
     END

Verify The Result Table,Name Must Contain Keywords
    FOR  ${element}     IN  @{actuallist}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${element}    ${input_text}
    END



























