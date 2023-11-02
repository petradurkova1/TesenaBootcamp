*** Settings ***
Documentation  tohle je popis nasi suity, link do JIRA, kontakt, dulezite parametry,
...  tady je druhy radek do dokumentace
Library  SeleniumLibrary
Test Setup    Nas start  # Suite setup pro vice testu zaroven
Test Teardown  Close Browser  # test teardown - uklid po testech, provede se i kdyz test spadne

*** Variables ***  # je dostupna vsude
${URL}  https://automationexercise.com/products 
${BROWSER}  chrome
${input_search}  //input[@id="search_product"]  
${search_button}  //button[@id="submit_search"]
${page_title}  //h2[contains(@class,"title")]

*** Keywords ***
Nas start
    [Documentation]  Vlastni keyword pro otevereni browseru a maximalizaci
    Open Browser  ${URL}  browser=${Browser}
    Maximize Browser Window

Vyhledej 
    [Documentation]  Vyhleda zadane slovo 
    [Arguments]  ${cohledat}
    Wait Until Element Is Visible  ${input_search}
    Capture Page Screenshot
    Input Text  ${input_search}  ${cohledat}
    Log  Zadal jsem neco do policka
    Click Element  ${search_button}

Zkontroluj
    [Documentation]  Zkontroluje, ze se slovo vyhledalo
    [Arguments]  ${cokontrolovat}
    Wait Until Element Contains  ${page_title}  SEARCHED PRODUCTS  timeout=10s
    Page Should Contain  text=${cokontrolovat}
    Location Should Contain  expected=${cokontrolovat}   # v URL stranky
    Sleep  2s

*** Test Cases ***
Nas prvni TC
   [Documentation]  toto je dokumentace TC, JIRA, ID, varovani apod.
   ...  druhy radek
    Vyhledej  cohledat=Top
    Zkontroluj  cokontrolovat=Top

Nas druhy TC
    Vyhledej  Top
    Zkontroluj  Top