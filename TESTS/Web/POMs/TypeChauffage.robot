*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_biomasse}    //*[@data-test-id='202204071235160383500-7']
${loc_continuer}   //*[@name='pyCaseActionAreaButtons_pyWorkPage_23']
*** Keywords ***
 choisir chauffage par biomasse

  Click If Element Is Enabled                    ${loc_biomasse} 
  Click If Element Is Enabled                    ${loc_continuer} 