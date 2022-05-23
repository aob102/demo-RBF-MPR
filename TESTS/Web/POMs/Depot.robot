*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${CheckEngagement}                            //*[@id='601c62b5']
${loc_deposer}                                //button[@name='pyCaseActionAreaButtons_pyWorkPage_51']
*** Keywords ***
 deposer la demande de subvention 

  Click If Element Is Enabled                    ${CheckEngagement} 
  Click If Element Is Enabled                    ${loc_deposer} 
