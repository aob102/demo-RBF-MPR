
*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_pret}   //button[@name='FaireSaDemande_pyPortalHarness_93']
${loc_continuer}   //button[@name='FaireSaDemande_pyPortalHarness_93']
*** Keywords ***
commencer la demande

  Click If Element Is Enabled    ${loc_pret}
