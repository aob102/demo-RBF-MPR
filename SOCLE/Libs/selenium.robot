*** Setting ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Collections    

   

*** Variables ***
${SELENIUM_GRID_URL}    http://localhost:4444/wd/hub
${SELENIUM_TIMEOUT}    10 seconds
${SELENIUM_IMPLICITWAIT}    5 seconds
${SELENIUM_SPEED}    0 seconds
${SKIP_Highlight}    ${False}

*** Keyword ***
Init Conf
    [Arguments]    ${screen}=${0}
    SeleniumLibrary.Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    SeleniumLibrary.Set Browser Implicit Wait    ${SELENIUM_IMPLICITWAIT}
    SeleniumLibrary.Set Selenium Speed    ${SELENIUM_SPEED}
    IF    ${screen} == ${0}
        SeleniumLibrary.Maximize Browser Window
    ELSE
        SeleniumLibrary.Set Window Size    height=850    width=${screen}
    END
    
Open CHROME
   SeleniumLibrary.Open Browser    browser=chrome
    
Open FIREFOX
    SeleniumLibrary.Open Browser    browser=firefox    

# Un exemple de configuration complexe pour chrome pour ajouter des options, arguments, prefs
Open CUSTOM_CHROME
    [Documentation]    Open portable chrome with options   
    ...    https://chromedriver.chromium.org/capabilities
    ...    chrome://version/
    ...    https://peter.sh/experiments/chromium-command-line-switches/
    ...    args chrome://flags/
    ...    with chrome_binary
    ...    with ignore popup controled by automation tools
    ...    with download file automaticay to outputdir    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    #Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    #Call Method    ${chrome_options}    add_argument    --disable-setuid-sandbox
    # AUTOMATICALY DEFAULT DOWNLOAD DIRECTORY
    ${prefs}    Create Dictionary    download.default_directory=${OUTPUT DIR}
    ...    profile.default_content_settings.popups=${0}
    ...    profile.default_content_setting_values.notifications=${2}
    ...    profile.password_manager_enabled=${False}
    ...    credentials_enable_service=${False}    
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}  
    # DISABLE POPUP CHROME CONTROLED BY AUTOMATION TOOLS
    Call Method    ${chrome_options}    add_experimental_option    useAutomationExtension    ${False}
    ${excluded}    Create List    enable-automation
    Call Method    ${chrome_options}    add_experimental_option    excludeSwitches    ${excluded}
    # SET CHROME PORTABLE BINARY
    ${chromebinary}    String.Replace String    %{chromebinary}    \\    /
    ${chrome_options.binary_location}    BuiltIn.Set Variable    ${chromebinary}    
    SeleniumLibrary.Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}     

Open REMOTE_CHROME
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome options}   add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-infobars    
    ${capabilities}=     Call Method     ${chrome_options}    to_capabilities
    Collections.Set To Dictionary    ${capabilities}    applicationName    TEST     
    Create Webdriver    Remote   command_executor=${SELENIUM_GRID_URL}    desired_capabilities=${capabilities}


Open Url
    [Documentation]    Ouvrir une url et vérifier le titre et l'url cible
    ...    par défaut l'url cible est l'url de navigation
    ...    si ce n'est pas le cas mettre l'url de redirection
    [Arguments]    ${url}    ${title}    ${redirect_url}=${url}    
    SeleniumLibrary.Go To    ${url}
    SeleniumLibrary.Wait Until Location Contains    ${redirect_url}
    SeleniumLibrary.Title Should Be    ${title}

Close Browsers
    [Documentation]    Fermeture de tous les navigateurs
    SeleniumLibrary.Close All Browsers
    
Capture Step ScreenShot
    [Documentation]    Capture avec règle de nommage du fichier
    ...    Le step permet d'identifier l'étape et de faire plusieurs captures par test
    [Arguments]    ${step}
    SeleniumLibrary.Capture Page Screenshot    ${OUTPUT DIR}${/}${TEST NAME}_${step}.png

Capture Step Element ScreenShot
    [Documentation]    Capture d'un élément avec règle de nommage du fichier
    ...    Le step permet d'identifier l'étape et de faire plusieurs captures par test
    [Arguments]    ${step}    ${locator}
    Sync Locator Into View    ${locator}
    SeleniumLibrary.Capture Element Screenshot    ${locator}    ${OUTPUT DIR}${/}${TEST NAME}_${step}.png

Capture Step Text ScreenShot
    [Documentation]    Cherche un élément par un contain texte et le capture avec règle de nommage du fichier
    ...    Le step permet d'identifier l'étape et de faire plusieurs captures par test
    [Arguments]    ${step}    ${text}
    ${locator}    BuiltIn.Set Variable    //*[contains(text(),'${text}')]
    Sync Locator Into View    ${locator}    
    SeleniumLibrary.Capture Element Screenshot    ${locator}    ${OUTPUT DIR}${/}${TEST NAME}_${step}.png

Capture Step Html Source
    [Documentation]    Capture du source de la page
    ...    Doit etre utilisé systématiquement dans le Test Teardown en cas de failed
    ...    Cela permet d'inspecter sur ce source sans avoir besoin de renaviguer manuellement
    ...    Gain de temps en maintenance    
    [Arguments]    ${step}
    ${html}    SeleniumLibrary.Get Source
    OperatingSystem.Create File    path=${OUTPUT DIR}${/}${TEST NAME}_${step}.html    content=${html}, encoding=UTF-8               

# ---------------------------------------------------------------------------------------
# En SELENIUM, il est indispensable au click que l'élement soit visible 
# Attention si vous placez l'élément en haut de page, il peut être masqué par un bandeau
# exemple : element is not clickable at point because another element obscures it 
# Préférez placer l'élément en haut avec un delta
# Pensez à déplacer le bon éléments pour vos captures d'écrans
# exemple pour capturer un formulaire je déplace le titre du formulaire en haut 
# le scroll element into view ne déplace pas l'élément s'il est déjà visile 
# ---------------------------------------------------------------------------------------

    
Sync Locator Into View
    [Documentation]    Permet de rendre visible l'élément dans la page
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Highlight    ${locator}

Sync Locator To Top Page
    [Documentation]    Permet de placer l'élément en haut de page avec delta
    ...    Par defaut le delta=0
    ...    Le delta peut être la hauteur d'un bandeau 
    [Arguments]    ${locator}    ${delta_top}=0
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    ${el_pos_y}    SeleniumLibrary.Get Vertical Position    ${locator}
    ${final_y}    BuiltIn.Evaluate    int(${el_pos_y}) -int(${delta_top})
    SeleniumLibrary.Execute Javascript    window.scrollTo(0, arguments[0])    ARGUMENTS    ${final_y}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Highlight    ${locator}
    
Sync Locator To Middle Page
    [Documentation]    Permet de placer l'élément en milieu de page
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    ${el_pos_y}    SeleniumLibrary.Get Vertical Position    ${locator}
    ${el_size}    SeleniumLibrary.Get Element Size    ${locator}
    ${el_height}    BuiltIn.Evaluate    int(${el_size}[1])    
    ${win_size}    SeleniumLibrary.Get Window Size
    ${win_height}    BuiltIn.Evaluate    int(${win_size}[1]) 
    ${final_y}    BuiltIn.Evaluate    int(${el_pos_y}) -int(${win_height})/2 +1.5*int(${el_height})              
    SeleniumLibrary.Execute Javascript    window.scrollTo(0, arguments[0])    ARGUMENTS    ${final_y}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Highlight    ${locator}

Sync Text Into View
    [Documentation]    Cherche un élément par son texte et permet de le rendre visible dans la page
    [Arguments]    ${text}
    ${locator}    BuiltIn.Set Variable    //*[contains(text(),'${text}')]
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Highlight    ${locator}

Sync Text Into Element
    [Documentation]    Cherche un élément par son texte et permet de le rendre visible dans la page
    [Arguments]    ${text}    ${locator}
    ${textLocator}    BuiltIn.Set Variable    (${locator})[contains(text(),'${text}')]
    SeleniumLibrary.Wait Until Page Contains Element    ${textLocator}
    SeleniumLibrary.Scroll Element Into View    ${textLocator}
    SeleniumLibrary.Wait Until Element Is Visible    ${textLocator}
    Highlight    ${textLocator}

Sync Text Into Block
    [Documentation]    Cherche un élément par son texte et permet de le rendre visible dans la page
    [Arguments]    ${text}    ${locator}
    ${textLocator}    BuiltIn.Set Variable    (${locator}//*)[contains(text(),'${text}')]
    SeleniumLibrary.Wait Until Page Contains Element    ${textLocator}
    SeleniumLibrary.Scroll Element Into View    ${textLocator}
    SeleniumLibrary.Wait Until Element Is Visible    ${textLocator}
    Highlight    ${textLocator}

Sync Text To Top Page
    [Documentation]    Cherche un élément par son texte et permet de le placer en haut de page avec delta
    ...    Par defaut le delta=0
    ...    Le delta peut être la hauteur d'un bandeau 
    [Arguments]    ${text}    ${delta_top}=0
    ${locator}    BuiltIn.Set Variable    //*[contains(text(),'${text}')]
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    ${el_pos_y}    SeleniumLibrary.Get Vertical Position    ${locator}
    ${final_y}    BuiltIn.Evaluate    int(${el_pos_y}) -int(${delta_top})
    SeleniumLibrary.Execute Javascript    window.scrollTo(0, arguments[0])    ARGUMENTS    ${final_y}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Highlight    ${locator}

Sync Text To Middle Page
    [Documentation]    Cherche un élément par son texte et permet de le placer en milieu de page
    [Arguments]    ${text}
    ${locator}    BuiltIn.Set Variable    //*[contains(text(),'${text}')]
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    ${el_pos_y}    SeleniumLibrary.Get Vertical Position    ${locator}
    ${el_size}    SeleniumLibrary.Get Element Size    ${locator}
    ${el_height}    BuiltIn.Evaluate    int(${el_size}[1])    
    ${win_size}    SeleniumLibrary.Get Window Size
    ${win_height}    BuiltIn.Evaluate    int(${win_size}[1]) 
    ${final_y}    BuiltIn.Evaluate    int(${el_pos_y}) -int(${win_height})/2 +1.5*int(${el_height})              
    SeleniumLibrary.Execute Javascript    window.scrollTo(0, arguments[0])    ARGUMENTS    ${final_y}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    Highlight    ${locator}

Sync Input Text
    [Documentation]    Synchro et input text 
    [Arguments]    ${locator}    ${text}
    Sync Locator Into View    ${locator}    
    SeleniumLibrary.Input Text    ${locator}    ${text}

Sync Click
    [Documentation]    Synchro et click
    [Arguments]    ${locator}
    Sync Locator Into View    ${locator}
    SeleniumLibrary.Click Element    ${locator}
    
Sync ClickJS
    [Documentation]    Synchro et click en javascript si erreur avec selenium
    [Arguments]    ${locator}
    Sync Locator Into View    ${locator}
    ${el}    SeleniumLibrary.Get WebElement    ${locator}
    SeleniumLibrary.Execute Javascript    arguments[0].click()    ARGUMENTS    ${el}    
    
Sync Get Text
    [Documentation]    Synchro et get text
    [Arguments]    ${locator}
    [Return]    ${text}
    Sync Locator Into View    ${locator}    
    ${text}    SeleniumLibrary.Get Text    ${locator}
    
Sync Get Attribute
    [Documentation]    Synchro et get attribute
    [Arguments]    ${locator}    ${attribute}
    [Return]    ${text}
    Sync Locator Into View    ${locator}    
    ${text}    SeleniumLibrary.Get Element Attribute    ${locator}    ${attribute}

Sync Select From List By Label
    [Documentation]    Synchro et select list by label
    # Un des problème n'est pas la synchro sur l'élément select mais sur la syncho du contenu de la liste
    # Le select From List By Label n'attend pas si le label n'est pas présent et lève une exception 
    # alors qu'il arrive souvent que les listes soient rechargées dynamiquement en fonction de l'action précédente
    # une étape Wait Until Element Contains est donc obligatoire
    [Arguments]    ${locator}    ${label}
    Sync Locator Into View    ${locator}    
    SeleniumLibrary.Wait Until Element Contains    ${locator}    ${label} 
    SeleniumLibrary.Select From List By Label    ${locator}    ${label}   

Highlight
    [Arguments]    ${locator}
    # Change le style de couleur de l'élément pour le mettre en évidence (le bord en rouge et le fond en jaune)
    # Le style est repositionné par défault 
    # Pour desactiver le Highlight mettre la variable globale SKIP_Highlight à ${True}
    # Le return stoppe le keyword et ne fait pas de Highlight si SKIP_Highlight=True
    BuiltIn.Return From Keyword If    ${SKIP_Highlight}
    ${element}=    Get WebElement    ${locator}
    ${original_style}    Execute Javascript
    ...   element = arguments[0];
    ...   original_style = element.getAttribute('style');
    ...   element.setAttribute('style', original_style + "; color: red; background: yellow; border: 2px solid red;");
    ...   return original_style;
    ...   ARGUMENTS
    ...   ${element}
    BuiltIn.Sleep    0.2s    
    Execute Javascript
    ...   element = arguments[0];
    ...   original_style = arguments[1];
    ...   element.setAttribute('style', original_style);
    ...   ARGUMENTS
    ...   ${element}
    ...   ${original_style}

Switch To New Window
    [Documentation]    Switch to new window and return previous window handle
    [Return]    ${previousWindows}
    Execute Javascript    window.open()
    ${previousWindows}    SeleniumLibrary.Switch Window    NEW

Switch To Window
    [Documentation]    Switch to window
    [Arguments]    ${Windows}
    SeleniumLibrary.Switch Window    ${Windows}

Switch To Last Window
    [Documentation]    Switch to last window
    SeleniumLibrary.Switch Window    NEW
    
Switch To Main Window
    [Documentation]    Switch to main window
    SeleniumLibrary.Switch Window    MAIN
Click If Element Is Enabled
  [Arguments]       ${locator}
  Wait Until Keyword Succeeds    10    1s    Scroll Element Into View    ${locator}
  Wait Until Element Is Enabled    ${locator}
  Wait Until Keyword Succeeds    10    1s      Click Element    ${locator}
  
