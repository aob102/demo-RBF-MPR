*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_monDossier}                                               //*[@name='CaseEspacePerso_D_pyMyCasesTree.pxResults(1)_58']
${loc_completDem}                                               //*[@name='ReviewAndDownloadSection_pyWorkPage_229']
${loc_demarcheSeul}                                             //*[@name='CompleterMaDemande_pyWorkPage_33']
${loc_cont2}                                                    //*[@name='pyCaseActionAreaButtons_pyWorkPage_22']
*** Keywords ***
Completer ma demande
  Wait Until Element Is Visible                                 ${loc_monDossier} 
  Click Element                                                 ${loc_monDossier}
  Wait Until Element Is Visible                                 ${loc_completDem}    
  Click Element                                                 ${loc_completDem}
Faire la demande Seul 
     Wait Until Element Is Visible                                 ${loc_demarcheSeul} 
     Wait Until Element Is Enabled                                 ${loc_demarcheSeul} 
     Click Element                                                 ${loc_demarcheSeul} 
     Scroll Element Into View                                      ${loc_cont2}
     Wait Until Element Is Enabled                                 ${loc_cont2} 
     Wait Until Keyword Succeeds    10    1    Click Element                                                 ${loc_cont2} 

    