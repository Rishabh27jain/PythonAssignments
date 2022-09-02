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
Go To Home And Click Anniversary And Retrive Records
    mouse over          css:.dropdown-toggle
    click element       xpath://ul[@role='menu']/li[4]
    select from list by value        css:.search_anni      02
    @{elements}     Get WebElements     css:table.table-hover>tbody>tr>td:nth-child(1)
    	LOG             ${elements}
    	FOR    ${element}    IN     ${elements}
        	LOG     ${element}
        	Append To List    ${actuallist}       ${element}
    	END
    	LOG     ${actuallist}


Go To URL And Click On Wishing You And Retrive Records
    click element       xpath://img[@title='View all anniversaries']
    @{expectedlist}   create list
    @{elements}     Get WebElements     css:table.table-hover>tbody>tr>td:nth-child(1)
    LOG             ${elements}
    FOR    ${element}    IN     ${elements}
        LOG     ${element}
        Append To List    ${expectedlist}       ${element}
    END
    LOG     ${expectedlist}
    lists should be equal  ${actuallist}    ${expectedlist}


Verify Both List Are Same
   lists should be equal  ${actuallist}    ${expectedlist}

























