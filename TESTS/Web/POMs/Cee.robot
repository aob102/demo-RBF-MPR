*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_Non1}                         //label[@for='968dde4c02']
${loc_Oui1}                         //div[@data-test-id='20190903160907043564-3']//input[@id='AmountTTCPlanFin']
${loc_Non2}                         //label[@for='d66926fa02']
${loc_Oui2}                         //div[@data-test-id='20190903160907043564-4']//input[@id='AmountTTCPlanFin']
${loc_contiuner_6}                        //button[@name='pyCaseActionAreaButtons_pyWorkPage_55']
*** Keywords ***
 choisir non pour les aides

  Click If Element Is Enabled                    ${loc_Non1} 
  Click If Element Is Enabled                    ${loc_Non2}
  Click If Element Is Enabled                    ${loc_contiuner_6}
