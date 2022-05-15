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
TNR 1 
  [Tags]  WEB 
  Montage du dossier de subvention pour un profil TMO

