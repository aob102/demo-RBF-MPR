*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_montant1}                  //div[@data-test-id='20190903160907043564-1']//input[@id='AmountTTCPlanFin']
${loc_continuer_4}                 //button[@name='pyCaseActionAreaButtons_pyWorkPage_48']
*** Keywords ***
renseingner le montant du premier travaux

  Click If Element Is Enabled                  ${loc_montant1} 
  Input Text                                   ${loc_montant1}           911
  Click If Element Is Enabled                  ${loc_continuer_4}


