*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Login.robot
Resource    ../../Data/Comptes.robot
Resource  ../../Env/ENV_RECETTE.robot
#Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
#Resource    ../Web/Steps/StepsConnexion.robot
*** Keywords ***
# GIVEN
 # l'utilisateur est sur la page de connexion
    # [Documentation]    L'utilisateur accède à la page de connexion   
  #   KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
######################################## Tests profil consultant #####################################
# WHEN
#l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que instructeur 
   # [Documentation]    Connexion valide pour un consultant
  #  [Tags]    Critique    
 #   Login.Kw_Login    tnr3@yopmail.com    @azertY147  
# THEN
# l'utilisateur est redirigé sur la page du Dashboard Consultant 
  #  SeleniumLibrary.Wait Until Page Contains Element    ${loc_Dashboard}
  #  SeleniumLibrary.Wait Until Element Contains    ${loc_message}    ${message_consultant}
    #FOR    ${section}    IN    @{formateur_consultant_sections}
 #       SeleniumLibrary.Page Should Contain    ${section}
   # END
   # KwLaunchCloseLogout.Kw_LogOut

    
