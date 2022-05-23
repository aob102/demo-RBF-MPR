*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Resource    MyApplications.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_MesActivite}              //div[@data-tour-id='cm-primary-navigation']/div/ul[1]/li[1]
${loc_WB1}                      //div[@data-tour-id='cm-primary-navigation']/div/ul//span[contains(text(),'Portefeuille collectif')]
${loc_WL1}                      //div[@data-tour-id="cm-primary-navigation"]/div/ul//span[contains(text(),'Les dossiers du jour')]
${Dossier}                      //tr[@id="$PpgRepPgSubSectionWB1SectionBB$ppxResults$l1"]//input[@type='checkbox']
${loc_transferer}               //button[@name='WB1Section_pyDisplayHarness_1']
${frameWBWL}                    //iframe
${testDossier}                 //tr[contains(@oaargs,'__MPR__')]/td[1]
${NumeroDossier1}              MPR-2022-337353
*** Keywords ***
acceder au WB de l'instructeur
  Click If Element Is Enabled                  ${loc_MesActivite} 
  Click If Element Is Enabled                  ${loc_WB1}
  Sleep    2s

acceder au WL de l'instructeur
  Unselect Frame
  Click If Element Is Enabled                  ${loc_MesActivite} 
  Click If Element Is Enabled                  ${loc_WL1}
  Sleep    2s
selectionner le dossier
  ${LocatorDossier}  Locator Maker
  Select Frame    ${frameWBWL}
  Click If Element Is Enabled                  ${LocatorDossier}    
transfer au WL1
   Click If Element Is Enabled                  ${loc_transferer}  
Locator Maker
  [Return]  ${LocatorDossier}
  ${LocatorDossier}  Replace String    ${testDossier}    __MPR__    ${NumeroDossier}
  Log To Console    ${LocatorDossier}

