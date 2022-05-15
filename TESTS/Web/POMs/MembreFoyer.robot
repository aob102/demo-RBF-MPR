*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_supprimerMembre}  //*[@id='$PpyWorkPage$pListOFOccupantsWithoutTax$l__ligne__']//i
${loc_supprimerTousMembre}   //i[@style='width:25px;height:30px;']
${loc_scroll}   //*[@name='AddItem2_pyWorkPage_3']
${l}  //*[@node_name="DeleteItem"][@index='__l__']
${ll}   //*[@name='DeleteItem_pyWorkPage.ListOFOccupantsWithoutTax(3)_3']  
${lll}   //*[@name='DeleteItem_pyWorkPage.ListOFOccupantsWithoutTax(2)_3'] 
${loc_nbOccupant}   //*[@name='$PpyWorkPage$pOccupantsNumber']
${Continuer}   //button[@name='pyCaseActionAreaButtons_pyWorkPage_122']
*** Keywords ***
supprimer membre de foyer

  Click If Element Is Enabled    ${loc_supprimerMembre}
  Sleep    3000s
supprimer tous les les autres membres
   
    Wait Until Element Is Visible    ${loc_scroll}
    Wait Until Keyword Succeeds    10    1s    Scroll Element Into View    ${loc_nbOccupant}
    ${nbOccupant}  Get Text    ${loc_nbOccupant}
    ${INTnbOccupant}  Convert To Integer    ${nbOccupant}
  FOR  ${i}  IN RANGE  1  ${INTnbOccupant}
     ${nbOccupant1}  Get Text    ${loc_nbOccupant}
     ${j}   Convert To String    ${i}
     ${loc}=  Replace String    ${loc_supprimerMembre}    __ligne__    ${nbOccupant1}
     Log To Console    ${loc}
     Scroll Element Into View    ${loc}
     Click Element  ${loc}
     Sleep  1s   
     

  
  END
  