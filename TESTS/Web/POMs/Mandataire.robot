*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${Demandeur}                                   //*[@name='CompleterMaDemande_pyWorkPage_33']
${loc_continuer}                               //*[@name='pyCaseActionAreaButtons_pyWorkPage_23']

*** Keywords ***

deposer une demande sans mandataire

  Click If Element Is Enabled                  ${Demandeur}
  Click If Element Is Enabled                  ${loc_continuer}