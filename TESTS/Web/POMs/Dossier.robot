*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_completerMaDemande}                  //a[@name="ReviewAndDownloadSection_pyWorkPage_22"]

*** Keywords ***
Completer ma demande de solde

  Click If Element Is Enabled                  ${loc_completerMaDemande} 
