*** Settings ***
Library    SeleniumLibrary
Resource   ../../TESTS/Data/Locators.robot


*** Keywords ***
lancer le navigateur et l'environnement
    [Documentation]    Lancement de l'application dans un navigateur
    ...    ${URL} Url de l'application à lancer
    ...    ${browser} Navigateur à utiliser
    ...    ${exceptedTitle} Titre de la page attendue
    [Arguments]    ${URL}     
    SeleniumLibrary.Go To    url=${URL}
    SeleniumLibrary.Maximize Browser Window
    ${currentTitle}    SeleniumLibrary.Get Title

     
Kw_close_all_browsers
    [Documentation]    Fermeture de tous les navigateurs ouverts
    Sleep    1   
    SeleniumLibrary.Close All Browsers
   
    
Kw_LogOut
    [Documentation]    Déconnexion à l'application
    SeleniumLibrary.Click Button     ${loc_mainMenu}
    SeleniumLibrary.Click Element    ${loc_logOut}
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_email}
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_mdp}
    