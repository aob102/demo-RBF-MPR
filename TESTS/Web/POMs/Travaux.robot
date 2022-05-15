*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_chauffage}                             //div[@data-test-id='201908221708140584771-1']
${loc_isolation}                             //div[@data-test-id='201908221708140584771-2']
${loc_ventilation}                           //div[@data-test-id='201908221708140584771-3']
${loc_audit}                                 //div[@data-test-id='201908221708140584771-4'] 
${loc_bonus}                                 //div[@data-test-id='201908221708140584771-5']
${loc_amo}                                   //div[@data-test-id='201908221708140584771-6']
${loc_continuer}                             //button[@name='pyCaseActionAreaButtons_pyWorkPage_24']
*** Keywords ***
choisir travaux d'isolation 

  Click If Element Is Enabled                  ${loc_isolation}
  Click If Element Is Enabled                  ${loc_continuer}   

