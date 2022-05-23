*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${frame1}                      //iframe[@id="PegaGadget1Ifr"]
${crtlnon}                     //input[@name="$PpyWorkPage$pIsControlAvance2" and  @value='Non']/following-sibling::label
${refuser}                     //button[contains(text(),'Rejet demande de subvention')]
${motif_1}                     //input[@name="$PpyWorkPage$pMotifsDeRejetAssocis$l1$ppySelected"]
${valider_motif_rejet}         //button[@name="MotifsRejetSubvention_pyWorkPage_42"]
${valider_le_rejet}            //button[contains(.,'Valider l’instruction du dossier')]
*** Keywords ***
rejeter subvention par instructeur
  Unselect Frame
  Select Frame                                 ${frame1}
  Click If Element Is Enabled                  ${crtlnon} 
  Click If Element Is Enabled                  ${refuser}
  Unselect Frame
  Wait Until Keyword Succeeds    20    1s    Select Frame                                 ${frame1} 
  Click If Element Is Enabled                  ${motif_1}
  Click If Element Is Enabled                  ${valider_motif_rejet} 
  Click If Element Is Enabled                  ${valider_le_rejet}

