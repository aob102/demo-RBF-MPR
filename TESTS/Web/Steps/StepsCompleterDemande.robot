*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Login.robot
Resource    ../POMs/ChoixProfil.robot
Resource    ../POMs/InfoPerso.robot
Resource    ../POMs/NumFisc.robot
Resource    ../POMs/ReadyPage.robot
Resource    ../POMs/MembreFoyer.robot
Resource    ../POMs/InfoLog.robot
Resource    ../POMs/CreationCompte.robot
Resource    ../POMs/Compte.robot
Resource    ../../Data/Comptes.robot
Resource  ../../Env/ENV_RECETTE.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
#Resource    ../Web/Steps/StepsConnexion.robot
*** Variables ***





*** Keywords ***
l'utilisateur renseigne les champs "Email" et "Mot de passe"
  [Arguments]   ${email}     ${mdp}
  Login.Kw_Login   ${email}    ${mdp}
  Completer ma demande
  #Faire la demande Seul
  choisir le type maison  
  saisir les info logement
  preciser la duree de residance
  choisir proprietaire
  certifier propriétaire du logement
  televerser titre de propriete