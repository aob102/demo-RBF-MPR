*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_surface}                  //*[@id='c2ffa2bc']
${loc_resistance}               //*[@id='4c70a55f']
${loc_continuer_3}                //*[@name='pyCaseActionAreaButtons_pyWorkPage_122']
*** Keywords ***
renseingner les informations travaux d'isolation interieur

  Wait Until Element Is Visible                ${loc_surface}
  Input Text                                   ${loc_surface}        70
  Click If Element Is Enabled                  ${loc_resistance}
  Wait Until Keyword Succeeds    10    1s    Input Text           ${loc_resistance}     5
  Wait Until Keyword Succeeds    10    1s    Input Text           ${loc_resistance}     5
  ${resitance}  Get Text    ${loc_resistance}
 # IF    ${resitance} != '5'
  Wait Until Keyword Succeeds    10    1s    Input Text           ${loc_resistance}     5  
      
  #END
  Click If Element Is Enabled                  ${loc_continuer_3}   
  

 
