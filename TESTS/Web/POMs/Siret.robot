*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_continuer}             //*[@name='pyCaseActionAreaButtons_pyWorkPage_23']
${loc_Siret_1}               //*[@data-test-id='201908301228310488248-1']//input[@data-test-id='20190830144725099621178']
${loc_Date_1}                //*[@data-test-id='201908301228310488248-1']//input[@data-test-id='201908301447250997212737']
${AjouterTravaux}            //img[@data-test-id='20190904181943022960481']
*** Keywords ***
renseingner les informations travaux d'isolation interieur

  Wait Until Element Is Visible                ${loc_Siret_1} 
  Input Text                                   ${loc_Siret_1}          53875955600011
  Input Text                                   ${loc_Date_1}           02/07/2021
  Click If Element Is Enabled                  ${loc_continuer}   

 