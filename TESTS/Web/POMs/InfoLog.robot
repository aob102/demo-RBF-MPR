*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${loc_maison}   //img[@name='TileStandard_D_NomenclatureList_pa-8380763726914094603pz.pxResults(1)_5']
${loc_radioLogFisc}  //input[@id='99952d8b01']/following-sibling::label
${loc_duree}   //div[@data-test-id='201908281104520483558']//*[contains(.,'+ de 2 ans')]
${loc_SituationProp}  //label[@for='7bb77c4e01']
${loc_certifierExa}  //input[@name='$PpyWorkPage$pLogementInfo$pPrincipalResidence'][@type='checkbox']
${loc_conti}  //button[@name='pyCaseActionAreaButtons_pyWorkPage_247']
${loc_creerCompte}  //button[@name='pyCaseActionAreaButtons_pyWorkPage_251']
${loc_clickToUpload}  //button[@name='PieceJustificative_pyWorkPage.LogementInfo.PiecesJustificativesListe.PieceJustificativeListeListe(1).PiecesJustificatives(1)_37']
${loc_clickToUpload1}  //button[@name='PieceJustificative_pyWorkPage.LogementInfo.PiecesJustificativesListe.PieceJustificativeListeListe(2).PiecesJustificatives(1)_37']
${loc_Upload}  //input[@id='$PpyAttachmentPage$ppxAttachName']
${loc_submit}  //button[@id='ModalButtonSubmit']
${loc_addToUpload}  //*[@name='PieceJustificativeMultiListe_pyWorkPage.LogementInfo.PiecesJustificativesListe_7']
${loc_adresspos}    //*[@name='$PSearchAddress$pPostCode']
${loc_rue}          //*[@name='$PSearchAddress$pFullAddress']
*** Keywords ***
 choisir le type maison   

    Click If Element Is Enabled  ${loc_maison}
choisir logement declaré au fisc

   Click If Element Is Enabled  ${loc_radioLogFisc}
preciser la duree de residance

    Click If Element Is Enabled  ${loc_duree}
choisir proprietaire 

    Click If Element Is Enabled  ${loc_SituationProp} 

certifier propriétaire du logement

    Click If Element Is Enabled  ${loc_certifierExa}

    Click If Element Is Enabled  ${loc_conti}
commencer a creer compte
     
    Click If Element Is Enabled  ${loc_creerCompte}  
televerser titre de propriete

  Click If Element Is Enabled    ${loc_clickToUpload}
  SeleniumLibrary.Wait Until Element Is Visible    ${loc_Upload}
  Choose File    ${loc_Upload}    ${EXECDIR}/test.pdf
  Click If Element Is Enabled    ${loc_Upload}
engagement bailleur 

  Click If Element Is Enabled    {loc_addToUpload}
  Click If Element Is Enabled    ${loc_clickToUpload1}
  SeleniumLibrary.Wait Until Element Is Visible    ${loc_Upload}
  Choose File    ${loc_Upload}    ${EXECDIR}/test.pdf
  Click If Element Is Enabled    ${loc_Upload}
  #PB
saisir les info logement
  Scroll Element Into View    ${loc_adresspos}
  Input Text    ${loc_adresspos}     45000 
  Scroll Element Into View    ${loc_rue}
  Input Text    ${loc_rue}     66 RUE DE LA GARE 