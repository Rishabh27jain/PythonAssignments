*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary
Resource          Variable.robot


*** Keywords ***

open the browser and login to intranet
    open browser    ${url}    ${browser_name}
    Wait Until Element Is Visible   id:cantAccessAccount      timeout=50
    Input Text          xpath://*[@type='email']    ${username}
    click button        id:idSIButton9
    input password      id:i0118                    ${password}
    Wait Until Element Is Visible   id:idA_PWD_ForgotPassword      timeout=50
    click button        xpath://input[@id="idSIButton9"]
    sleep                30
    Wait Until Element is Visible   id:displayName             timeout=50
    click button        id:idSIButton9

Close Browser session
    Close Browser






