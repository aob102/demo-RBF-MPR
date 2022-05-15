*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_ParcoursPO}   //button[@name='HomePage_pyPortalHarness_56']
${loc_ParcoursPB}   //button[@name='HomePage_pyPortalHarness_72']
${loc_AcceptCookie}  //button[@id='cookieChoiceAccept']
*** Keywords ***
choisir demande en tant que PO

  Click If Element Is Enabled   ${loc_AcceptCookie}
  Click If Element Is Enabled    ${loc_ParcoursPO}
choisir demande en tant que PB

  Click If Element Is Enabled    ${loc_AcceptCookie}
  Click If Element Is Enabled    ${loc_ParcoursPB}