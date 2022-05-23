*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${NouvellePrime}  //*[@data-test-id="20190904181943022960481"]
${VoirDossier}   //li[@id='$PD_pyMyCasesTree$ppxResults$l5']//button[@data-test-id='20191011113919010615759']                                  # PENSER A CHANGER L'ORDRE DE DOSSIER : IMPACTE VARIABLE SUIVANTE
${loc-NumDossier}    //*[@id="$PD_pyMyCasesTree$ppxResults$l5"]//div[@data-test-id='2019100915472206281040439' and contains(text(),'MPR')]     # PENSER A CHANGER L'ORDRE DE DOSSIER : VARAIABLE IMPACTE
*** Keywords ***
copier le numero de dossier et acceder au dossier
  ${NumeroDossier}  Get Text                                       ${loc-NumDossier}
  Set Global Variable    ${NumeroDossier}
  Click If Element Is Enabled                                   ${VoirDossier} 
                   
