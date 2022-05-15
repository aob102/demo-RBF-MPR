*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${Po}                                          //div[@data-test-id='202103221533520049225-1']//img[@data-test-id='2019082811145808458173']
${Pb}                                          //div[@data-test-id='202103221533520049225-2']//img[@data-test-id='2019082811145808458173']
${Continuer}                                   //*[@data-test-id='20210324114552005856776']
*** Keywords ***

choisir demande de PO

  Click If Element Is Enabled                  ${Po}
  Click If Element Is Enabled                  ${Continuer}
  
choisir demande de PB

  Click If Element Is Enabled                  ${Pb}
  Click If Element Is Enabled                  ${Continuer}