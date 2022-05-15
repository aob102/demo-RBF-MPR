*** Settings ***
Library    SeleniumLibrary
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepsCreationDossier.robot
Resource    ../Web/Steps/StepsCompleterDemande.robot
Resource    ../baseTest.robot
Test Setup    baseTest.TestSetup
#Test Teardown    baseTest.TestTeardown
Suite Setup    baseTest.SuiteSetup
#Suite Teardown    baseTest.SuiteTeardown

Documentation    Test sur toutes les actions de la page de connexion pour tous les rôles.
####################
*** Test Cases ***
#test case 1

 # [Tags]  WEB
   #l'utilisateur est sur la page de connexion
   #l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que instructeur
   #Click If Element Is Enabled     //button[@name='CaseEspacePerso_D_pyMyCasesTree.pxResults(1)_2440']
   #Click If Element Is Enabled    //*[@name='ReviewAndDownloadSection_pyWorkPage_22']
   #Click If Element Is Enabled     //button[@name='PieceJustificative_pyWorkPage.LogementInfo.PiecesJustificativesListe.PieceJustificativeListeListe(1).PiecesJustificatives(1)_37']
 # SeleniumLibrary.Wait Until Element Is Visible    //*[@id='$PpyAttachmentPage$ppxAttachName']
   #Sleep    5s
  
   #Run Keyword And Ignore Error    Choose File    //*[@id='$PpyAttachmentPage$ppxAttachName']    ${EXECDIR}/test.pdf
   #Sleep    500s
création un dossier RG et un compte demandeur PO
  [Tags]  WEB 
  Given l'utilisateur est sur la page d'accueil et a lancé une demande
  And l'utilisateur de profil demandeur a choisit le profil PO a renseigné le numero fiscal  numFiscal=2008399999072
  And l'utilisateur de profil demandeur a renseigné ses infomations perso
  When l'utilisateur saisit son email et mot de passe  email=val@yopmail.com  pass=@azertY147
  Then l'utilisateur et redirigé à la page de confirmation 
activation de compte créé par un admin
   [Tags]  WEB 
   Given l'utilisateur renseigne les champs "Email" et "Mot de passe" de l'admin       aassoulaimani@anahprod            @ziZ1994
   When L'utilisateur active le compte
   L'utilisateur peut se connecter avec son compte
   Sleep    30s
#Completer la demande de subvention par demandeur PO
  
   

  