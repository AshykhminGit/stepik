*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}     Chrome
${URL}         https://www.google.com
${SEARCH_INPUT}    name=q
${SEARCH_BUTTON}   name=btnK
${RESULT_STATS}    id=result-stats

*** Test Cases ***
Google Search Test
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Given The Google search page is loaded
    When I enter a search query and submit
    Then I should see search results
    [Teardown]    Close Browser

*** Keywords ***
Given The Google search page is loaded
    Wait Until Element Is Visible    ${SEARCH_INPUT}    timeout=5s

When I enter a search query and submit
    Input Text    ${SEARCH_INPUT}    Robot Framework
    Press Keys    ${SEARCH_INPUT}    ENTER

Then I should see search results
    Wait Until Element Is Visible    ${RESULT_STATS}    timeout=5s
