*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***

${loc_dossierWL}                //tbody/tr[2]/td[2]        
${frame}                        //iframe

*** Keywords ***
Ouvrir le dossier
  Select Frame                                 ${frame}   
  Click If Element Is Enabled                  ${loc_dossierWL}
  Sleep    2s
