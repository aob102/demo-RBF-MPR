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

 création un dossier RG et un compte demandeur PB
  [Tags]  WEB 
  Given l'utilisateur est sur la page d'accueil et a lancé une demande
  And l'utilisateur de profil demandeur a choisit le profil PB a renseigné le numero fiscal  numFiscal=2003199999017
  Then l'utilisateur et redirigé à la page de confirmation
completer la demande PB
  [Tags]  WEB 
   Given l'utilisateur est sur la page de connexion
   And l'utilisateur renseigne les champs "Email" et "Mot de passe"            email=took@yopmail.com        mdp= @azertY147           
   Sleep  1000s