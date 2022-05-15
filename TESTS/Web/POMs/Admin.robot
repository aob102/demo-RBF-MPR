*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${searchBar}              //*[@name='$PpyDisplayHarness$ppySearchText']
${searchButton}           //*[@title='Rechercher']
${loc_AcceptCookie}       //button[@id='cookieChoiceAccept']
${loc_searchRes}          //*[@name='pzSearchResultName_pySearchResults.pxResults(1)_3']
${loc_action}             //button[@data-test-id='2014102117171207751300']
${loc_run}                //ul[@role='menu']//span[contains(text(),'Run')]
${keyBar}                 //*[@id='pyValue']
${buttEx}                 //div[contains(text(),'Exécuter')]
${loc_executer}           //*[@name='pzRunRecordButton_D_pzRunRecord.pxRunWindow(TABTHREAD0)_1']
*** Keywords ***
activer le compte 
  [Arguments]  ${nd}
  Wait Until Element Is Visible    ${searchBar}
  Input Text    ${searchBar}    VERIFYACCOUNT
  Click Element    //*[@title='Rechercher']
  Wait Until Element Is Visible   ${searchButton}
  Click Element    ${searchButton}
  Wait Until Element Is Visible   ${loc_searchRes}
  Click Element    ${loc_searchRes}
  Sleep    3s
  Select Frame    //iframe[@name='PegaGadget0Ifr']
  Click Element   ${loc_action}
  Click Element    ${loc_run}
  Switch To New Window
  Wait Until Element Is Visible    ${keyBar}
  Input Text    ${keyBar}    ${nd}  	
  Click Element    ${loc_executer}
  
