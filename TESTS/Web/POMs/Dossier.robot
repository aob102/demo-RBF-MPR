*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_completerMaDemande}                  //div[@data-test-id='20190903160907043564-1']//input[@id='AmountTTCPlanFin']

*** Keywords ***
Completer ma demande de solde

  Click If Element Is Enabled                  ${loc_completerMaDemande} 
