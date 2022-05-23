*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_continuer_2}             //*[@name='pyCaseActionAreaButtons_pyWorkPage_130']
${loc_IsoPlafond}             //div[@data-test-id='201908281104520483187846' and text()='Isolation de la toiture en pente - plafond de combles']
${loc_IsoExet}                //div[@data-test-id='201908281104520483187846' and text()='Isolation des murs par l’extérieur']
${loc_IsoInter}               //div[@data-test-id='201908281104520483187846' and text()='Isolation des murs par l’intérieur']
*** Keywords ***
choisir travaux d'isolation intern

  Click If Element Is Enabled                  ${loc_IsoInter}
  Click If Element Is Enabled                  ${loc_continuer_2}   
