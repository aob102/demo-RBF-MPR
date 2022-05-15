*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_continuer}                              //*[@name='pyCaseActionAreaButtons_pyWorkPage_46']
*** Keywords ***
 verifier la syntèse et Continuer

  Click If Element Is Enabled                    ${loc_continuer} 