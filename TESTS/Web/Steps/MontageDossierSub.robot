*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Login.robot
Resource    ../POMs/PagePOPB.robot
Resource    ../POMs/Cee.robot
Resource    ../POMs/Depot.robot
Resource    ../POMs/Devis.robot
Resource    ../POMs/Dossier.robot
Resource    ../POMs/FamilleTravaux.robot
Resource    ../POMs/InfoLog.robot
Resource    ../POMs/InfoPerso.robot
Resource    ../POMs/InfoTravaux.robot
Resource    ../POMs/Mandataire.robot
Resource    ../POMs/MembreFoyer.robot
Resource    ../POMs/MyApplications.robot
Resource    ../POMs/NumFi.robot
Resource    ../POMs/Siret.robot
Resource    ../POMs/Syntese.robot
Resource    ../POMs/Somme.robot
Resource    ../POMs/SousTravaux.robot
Resource    ../POMs/Travaux.robot
Resource    ../POMs/TypeChauffage.robot
Resource    ../../Data/Comptes.robot
Resource    ../../Env/ENV_RECETTE.robot
Resource    ../../../SOCLE/Libs/PreparationEnv.robot
Resource    ../POMs/WB1.robot
Resource    ../POMs/WL1.robot
Resource    ../POMs/DossierBO.robot
#Resource    ../Web/Steps/StepsConnexion.robot
*** Keywords ***

Montage du dossier 
     [Documentation]    L'utilisateur accède à la page de connexion   
     PreparationEnv.lancer le navigateur et l'environnement  ${site_web}[url]    
     Login.se connecter au compte demandeur par le portail SSO     rbf1@yopmail.com    123Rules*
     MyApplications.copier le numero de dossier et acceder au dossier
     Dossier.Completer ma demande de solde
     Mandataire.deposer une demande sans mandataire
     Travaux.choisir travaux d'isolation
     SousTravaux.choisir travaux d'isolation intern
     InfoTravaux.renseingner les informations travaux d'isolation interieur
     Siret.renseingner les informations travaux d'isolation interieur
     Devis.televerser le premier devis
     Somme.renseingner le montant du premier travaux
     Cee.choisir non pour les aides
     Syntese.verifier la syntèse et Continuer
     Depot.deposer la demande de subvention 
Instruction du dossier par l'instructeur
   SeleniumLibrary.Maximize Browser Window 
   se connecter au compte Adminstrateur Fonctionnelle par le portail PEGA   InstructeurAAS    @ziZ1994
   acceder au WB de l'instructeur
   selectionner le dossier
   transfer au WL1
   acceder au WL de l'instructeur
   Ouvrir le dossier
   rejeter subvention par instructeur






 




     





l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que instructeur 
    [Documentation]    Connexion valide pour un consultant
    [Tags]    Critique    
    Login.se connecter au compte demandeur par le portail SSO    tnr3@yopmail.com    @azertY147  


