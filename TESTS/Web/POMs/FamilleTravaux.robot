*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_TravauxSpec}  //*[@data-test-id='201908301554280887131-1']
${loc_Travauxrenglo}  //*[@data-test-id='201908301554280887131-2']
${continuer}  //button[@name='pyCaseActionAreaButtons_pyWorkPage_23']

*** Keywords ***

choisir travaux specifique 

  Click If Element Is Enabled                  ${loc_TravauxSpec}
  Click If Element Is Enabled                  ${Continuer}
choisir travaux de renovation globale 

  Click If Element Is Enabled                  ${loc_Travauxrenglo}
  Click If Element Is Enabled                  ${Continuer}