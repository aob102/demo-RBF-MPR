*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_AjouterDevis1}              //*[@data-test-id='201908301228310488248-1']//*[@data-test-id='20191113161049015815678']
${loc_Televerser}                 //*[@data-test-id='201908301228310488248-1']//button[@data-test-id='2019090511254205737677']
${loc_Fichier}                    //input[@id='$PpyAttachmentPage$ppxAttachName']
${loc_soumettre}                  //button[@id='ModalButtonSubmit']
${loc_continuer}                  //button[@name='pyCaseActionAreaButtons_pyWorkPage_23']
*** Keywords ***
televerser le premier devis

  Click If Element Is Enabled                  ${loc_AjouterDevis1} 
  Click Element                                ${loc_Televerser}
  Choose File                                  ${loc_Fichier}              devis.pdf 
  Click Element                                ${loc_soumettre}
  Click If Element Is Enabled                  ${loc_continuer}

