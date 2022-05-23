*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Resource    ../../Env/ENV_RECETTE.robot
Documentation    Contenant les éléments relatifs à la page de connexion

*** Variables ***
${invalidPwd}    Le mot de passe est invalide
${undefinUser}    L'utilisateur n'existe pas
${page_name}    Tipoca - Login

#${loc_BackHome}    //button[@name='pyActivity=@baseclass.OpenHomePage']
${loc_BackHome}    //button[@name='BackHome']





*** Keywords ***
se connecter au compte demandeur par le portail SSO
    [Documentation]    Connexion à l'application
    ...    ${input_userName} Username de l'utilisateur
    ...    ${input_pwd} Mot de passe de l'utilisateur
    [Arguments]    ${input_userName}    ${input_pwd}
    Kw_load_login_page
    SeleniumLibrary.Input Text    ${loc_email}    ${input_userName}    
    SeleniumLibrary.Input Password    ${loc_mdp}    ${input_pwd}
    Click If Element Is Enabled    ${loc_valider}
    
      
se connecter au compte Adminstrateur Fonctionnelle par le portail PEGA
    [Documentation]    Connexion à l'application
    ...    ${input_userName} Username de l'utilisateur
    ...    ${input_pwd} Mot de passe de l'utilisateur
    [Arguments]    ${input_userName}    ${input_pwd}
     Go to  ${site_PEGA}
    Wait Until Element Is Visible    ${loc_email_PEGA}
    SeleniumLibrary.Input Text    ${loc_email_PEGA}    ${input_userName}    
    SeleniumLibrary.Input Password    ${loc_mdp_PEGA}    ${input_pwd}
    Click If Element Is Enabled    ${loc_valider_PEGA}
   


Kw_load_login_page
    [Documentation]    Vérifie que les éléments de la pages de connexion sont bien présents   
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_email} 
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_mdp}
   # SeleniumLibrary.Wait Until Element Is Visible    ${loc_bg}
    
    #SeleniumLibrary.Wait Until Element Is Visible    ${loc_cgu}
    #SeleniumLibrary.Wait Until Element Is Visible    ${loc_btnConnexion}  

Kw_invalid_connection
    [Documentation]
    ...    Vérifie que la connexion n'a pas aboutie. On reste sur la page de connexion
    [Arguments]    ${elmt}   
    Kw_load_login_page
    SeleniumLibrary.Wait Until Element Is Visible    ${elmt}    
    
retour à l'accueil
  SeleniumLibrary.Wait Until Element Is Visible  ${loc_BackHome}
   SeleniumLibrary.Click Element    ${loc_BackHome}