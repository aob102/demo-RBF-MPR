*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_Monsieur}  //label[@for='d4bd976dMonsieur']
${loc_Madame}  //label[@for='d4bd976dMadame']
${loc_demandeur}  //i[@name='InfosPerso_TileUnselected1_pyWorkPage_1']
${loc_indic}  //option[@value='France (+33)']
${loc_indicList}              //select[@name='$PpyWorkPage$pCodeCountry']
${loc_phone}  //input[@id='phone']
${phone}  0735783423
${loc_continuer}  //button[@name='pyCaseActionAreaButtons_pyWorkPage_122']
${loc_check}                //input[@name='$PpyWorkPage$pHasAvisRectificatif']
${loc_adresseOui}  //*[@for='dd79de13Oui']
*** Keywords ***
choix monsieur
  Click If Element Is Enabled    ${loc_Monsieur}
choix madame
  Click If Element Is Enabled    ${loc_Madame}
selectionner le membre demandeur
  Click If Element Is Enabled  ${loc_demandeur}
preciser l'indicatif
  Select From List By Value    ${loc_indicList}    France (+33)
 # SeleniumLibrary.Click Element   ${loc_indicList}  
  #SeleniumLibrary.Click Element  ${loc_indic}
saisir le numero de telephone
  Scroll Element Into View    ${loc_continuer}
  SeleniumLibrary.Input Text  ${loc_phone}  ${phone}  
continuer la demande

  Click If Element Is Enabled  ${loc_continuer}
PB confimer adresse contact
  Click If Element Is Enabled  ${loc_adresseOui}
 