
*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_NumFiscal}   //input[@id='NumroFiscal']:
${loc_NumFi}   //*[@data-test-id="201910161808010238757"]
${loc_ReferenceAvis}    //input[@name='$PpyWorkPage$pRfrenceDavis']
${loc_checkAccept}   //input[@id='0b3cc32a']
${loc_continuer}  //button[@name='pyCaseActionAreaButtons_pyWorkPage_122']
*** Keywords ***
preciser le numero fiscal du demandeur
  [Arguments]  ${NumFiscal}
   SeleniumLibrary.Wait Until Element Is Visible    ${loc_NumFiscal}
  SeleniumLibrary.Input Text    ${loc_NumFiscal}  ${NumFiscal}    
preciser le numero d'avis d'impot du demandeur
  [Arguments]  ${ReferenceAvis}
  SeleniumLibrary.Input Text   ${loc_ReferenceAvis}    ${ReferenceAvis}    
accepter les condition d'utilisation
   Click If Element Is Enabled    ${loc_checkAccept} 
   Click If Element Is Enabled    ${loc_continuer}