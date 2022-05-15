*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_surface}                  //*[@id='c2ffa2bc']
${loc_resistance}               //*[@id='4c70a55f']
${loc_continuer}                //*[@name='pyCaseActionAreaButtons_pyWorkPage_200']
*** Keywords ***
renseingner les informations travaux d'isolation interieur

  Wait Until Element Is Visible                ${loc_surface}
  Input Text                                   ${loc_surface}        70
  Input Text                                   ${loc_resistance}     5
  Click If Element Is Enabled                  ${loc_continuer}   

 