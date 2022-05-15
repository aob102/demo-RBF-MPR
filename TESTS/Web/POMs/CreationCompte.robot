*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_emailIni}  //input[@name='$PpyWorkPage$pEmail']
${loc_emailconf}   //input[@id='EmailDeConfirmation']
${loc_passIni}    //input[@name='$PpyWorkPage$pPasswordAccount']
${loc_passConf}   //input[@name='$PpyWorkPage$pConfirmPasswordAccount']
${loc_ContButton}  //button[@name='pyCaseActionAreaButtons_pyWorkPage_252']
${loc_imgSuccess}  //img[@name='LightBoxEmail_pyWorkPage_4']
*** Keywords ***
saisir le mail
  [Arguments]   ${email}
  Wait Until Element Is Visible     ${loc_emailIni}
  scroll Element Into View  ${loc_emailIni}
  SeleniumLibrary.Input Text    ${loc_emailIni}    ${email}
  SeleniumLibrary.Input Text    ${loc_emailconf}    ${email}
saisir le mot de pass 
  [Arguments]   ${mdp}
  scroll Element Into View  ${loc_passIni} 
  SeleniumLibrary.Input Text    ${loc_passIni}    ${mdp}
  SeleniumLibrary.Input Text    ${loc_passConf}     ${mdp}
confirmer la creation de compte
  
  Click If Element Is Enabled    ${loc_ContButton} 
creation with success 
  [Return]    ${title}
  SeleniumLibrary.Wait Until Element Is Visible  ${loc_imgSuccess}
  Page Should Contain Image    ${loc_imgSuccess}
  ${titleCITE}  Get Title
  ${title}  Remove String    ${titleCITE}   CITE 
  Log To Console     le dossier est creé succes
  Log To Console    ${title}