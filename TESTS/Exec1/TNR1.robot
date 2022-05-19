*** Settings ***
Library    SeleniumLibrary
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/MontageDossierSub.robot
Resource    ../baseTest.robot
Test Setup    baseTest.TestSetup
Test Teardown    baseTest.TestTeardown
Suite Setup    baseTest.SuiteSetup
Suite Teardown    baseTest.SuiteTeardown

Documentation    Test sur toutes les actions de la page de connexion pour tous les rôles.
####################
*** Test Cases ***
FO-03-03-PO-Montage dossier Subvention Travaux Spécifiques
  [Tags]  WEB 
  Montage du dossier
BO-01-01-Gestion dossier WB et WL Subvention Instructeur
  Log To Console    TO BE CONTINUED