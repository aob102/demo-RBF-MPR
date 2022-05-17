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
Resource  ../../Env/ENV_RECETTE.robot
Resource    ../../../SOCLE/Libs/PreparationEnv.robot
#Resource    ../Web/Steps/StepsConnexion.robot
*** Keywords ***

Montage du dossier de subvention pour un profil TMO
     [Documentation]    L'utilisateur accède à la page de connexion   
     PreparationEnv.lancer le navigateur et l'environnement  ${site_web}[url]     ${site_web}[title]
     Login.se connecter au compte demandeur par le portail SSO     dmo0.o475f5c56@yopmail.com    123Rules*
     MyApplications.copier le numero de dossier et acceder au dossier
     Dossier.Completer ma demande de solde
     Mandataire.deposer une demande sans mandataire
     TypeChauffage. choisir chauffage par biomasse
     Travaux.choisir travaux d'isolation
     SousTravaux.choisir travaux d'isolation intern
     Devis.televerser le premier devis
     Siret.renseingner les informations travaux d'isolation interieur
     Somme.renseingner le montant du premier travaux
     Cee.choisir non pour les aides
     Syntese.verifier la syntèse et Continuer
     Depot.deposer la demande de subvention 






 




     





l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que instructeur 
    [Documentation]    Connexion valide pour un consultant
    [Tags]    Critique    
    Login.se connecter au compte demandeur par le portail SSO    tnr3@yopmail.com    @azertY147  


