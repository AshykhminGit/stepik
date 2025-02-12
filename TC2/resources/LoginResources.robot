*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://demoqa.com/login
${BROWSER}          Chrome
${USERNAME_FIELD}   id=userName
${PASSWORD_FIELD}   id=password
${LOGIN_BUTTON}     id=login
${LOGOUT_BUTTON}    id=submit
${ERROR_MESSAGE}    xpath=//p[contains(@class, 'error')]

*** Keywords ***
Open Login Page
    [Documentation]  Открывает страницу логина
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=5s

Close Browser
    [Documentation]  Закрывает браузер
    Close Browser

Enter Credentials
    [Arguments]  ${username}  ${password}
    [Documentation]  Вводит логин и пароль
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login
    [Documentation]  Нажимает кнопку логина
    Click Button    ${LOGIN_BUTTON}

Check Login Success
    [Documentation]  Проверяет успешный вход
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=5s

Check Login Failure
    [Documentation]  Проверяет неуспешный вход
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=5s
