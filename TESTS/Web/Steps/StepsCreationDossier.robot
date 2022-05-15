*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Login.robot
Resource    ../POMs/ChoixProfil.robot
Resource    ../POMs/InfoPerso.robot
Resource    ../POMs/NumFisc.robot
Resource    ../POMs/ReadyPage.robot
Resource    ../POMs/MembreFoyer.robot
Resource    ../POMs/InfoLog.robot
Resource    ../POMs/Admin.robot
Resource    ../POMs/CreationCompte.robot
Resource    ../../Data/Comptes.robot
Resource  ../../Env/ENV_RECETTE.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
#Resource    ../Web/Steps/StepsConnexion.robot
*** Variables ***
${pzinkey}   ANAH-AIDES-WORK____dossier____
*** Keywords ***
 #Given
l'utilisateur est sur la page d'accueil et a lancé une demande
  KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
  retour à l'accueil
#And 
l'utilisateur de profil demandeur a choisit le profil PO a renseigné le numero fiscal
  [Arguments]   ${numFiscal}
  choisir demande en tant que PO
  commencer la demande
  preciser le numero fiscal du demandeur  ${numFiscal}
  preciser le numero d'avis d'impot du demandeur  ${numFiscal}
  accepter les condition d'utilisation
l'utilisateur de profil demandeur a choisit le profil PB a renseigné le numero fiscal
  [Arguments]   ${numFiscal}
  choisir demande en tant que PB
  preciser le numero fiscal du demandeur  ${numFiscal}
  preciser le numero d'avis d'impot du demandeur  ${numFiscal}
  accepter les condition d'utilisation
#And 
l'utilisateur de profil demandeur a renseigné ses infomations perso
    choix monsieur
    selectionner le membre demandeur
    saisir le numero de telephone
    preciser l'indicatif
    continuer la demande
    continuer la demande
    supprimer tous les les autres membres
    continuer la demande
    choisir le type maison  
    choisir logement declaré au fisc
    #Sleep   1000s
    preciser la duree de residance
    choisir proprietaire
    certifier propriétaire du logement
    commencer a creer compte
l'utilisateur de profil demandeur a renseigné ses infomations perso PB
    choix monsieur
    selectionner le membre demandeur
    saisir le numero de telephone
    preciser l'indicatif
    PB confimer adresse contact
    continuer la demande
    continuer la demande
    supprimer tous les les autres membres
    continuer la demande  
#When
l'utilisateur saisit son email et mot de passe 
  [Arguments]   ${email}  ${pass}
  saisir le mail  ${email}
  saisir le mot de pass   ${pass}
  confirmer la creation de compte
#Then 
l'utilisateur et redirigé à la page de confirmation
  ${nDoss}  creation with success 
  Set Global Variable    ${nDoss}
#################
l'utilisateur renseigne les champs "Email" et "Mot de passe" de l'admin
  [Arguments]    ${email}    ${mdp}
  KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
  Login.Kw_Login   ${email}    ${mdp}
L'utilisateur active le compte
  ${pzdossier}=  Replace String    ${pzinkey}    ____dossier____    ${nDoss}
  activer le compte  ${pzdossier}
  Sleep    50s
L'utilisateur peut se connecter avec son compte
  Log To Console    le compte est activé