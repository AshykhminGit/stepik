*** Settings ***
Resource    ../resources/LoginResources.robot
Test Template    Login Test Case

*** Test Cases ***
Valid User Login
    validUser    validPassword

Invalid User Login (Wrong Password)
    validUser    wrongPassword

Invalid User Login (Wrong Username)
    wrongUser    validPassword

Invalid User Login (Empty Fields)
    ${EMPTY}    ${EMPTY}

*** Keywords ***
Login Test Case
    [Arguments]  ${username}  ${password}
    [Documentation]  Проверяет логин с разными данными
    Open Login Page
    Enter Credentials    ${username}    ${password}
    Click Login
    Run Keyword If    '${username}' == 'validUser' and '${password}' == 'validPassword'  
    ...    Check Login Success  
    ...    ELSE  
    ...    Check Login Failure
    Close Browser
