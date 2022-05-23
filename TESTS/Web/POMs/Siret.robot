*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_continuer}             //*[@name='pyCaseActionAreaButtons_pyWorkPage_122']
${loc_Siret_1}               //*[@data-test-id='201908301228310488248-1']//*[@name="$PpyWorkPage$pWorkProject$l1$pWorkCompany$pSiret"]
${loc_Date_1}                //*[@data-test-id='201908301228310488248-1']//input[@data-test-id='201908301447250997212737']
${AjouterTravaux}            //img[@data-test-id='20190904181943022960481']
*** Keywords ***
renseingner les informations travaux d'isolation interieur

  Wait Until Element Is Visible                ${loc_Siret_1} 
  Input Text                                   ${loc_Siret_1}          85278399200013
  Input Text                                   ${loc_Date_1}           02/07/2021
  Click If Element Is Enabled                  ${loc_continuer}   

 
