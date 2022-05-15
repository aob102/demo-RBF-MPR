*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot

Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${NouvellePrime}  //*[@data-test-id="20190904181943022960481"]
${VoirDossier}   //li[@id='$PD_pyMyCasesTree$ppxResults$l1']//button[@data-test-id='20191011113919010615759']
${loc-NumDossier}    //*[@id="$PD_pyMyCasesTree$ppxResults$l1"]//div[@data-test-id='2019100915472206281040439' and contains(text(),'MPR')]
*** Keywords ***
copier le numero de dossier et acceder au dossier
  ${NumDossier}  Get Text                                       ${loc-NumDossier}
  Click If Element Is Enabled                                   ${VoirDossier} 
                   