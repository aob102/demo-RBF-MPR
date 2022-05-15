*** Settings ***
Resource    Libs/selenium.robot 
*** Variables ***
# Variable pouvant être modifié par le run configuration 
# exemple --variable ENV:DEFAULT
#fnueqjn

@{ENV_ALLOWED}    RECETTE
@{PLATFORMS_ALLOWED}    CHROME    FIREFOX    CUSTOM_CHROME    REMOTE_CHROME
&{SCREEN_SIZES_ALLOWED}    DESKTOP=1260

${DEFAULT_ENV}    RECETTE
${DEFAULT_PLATFORM}    CHROME
${PIC_PLATFORM}    CUSTOM_CHROME

${ENV}    ${DEFAULT_ENV} 
${PLATFORM}    ${DEFAULT_PLATFORM}
${SCREEN}    DESKTOP

*** Keywords ***
Suite Setup
    BuiltIn.Log To Console    START SUITE   
    BuiltIn.Log To Console    CURDIR=${CURDIR}
    BuiltIn.Log To Console    EXECDIR=${EXECDIR}
    BuiltIn.Log To Console    OUTPUT DIR=${OUTPUT DIR}
    ${RBF_ENV}    Get Environment Variable    RBF_ENV    default=DEFAULT
    IF    "${RBF_ENV}" != "DEFAULT"
        ${ENV}=    Evaluate    "${RBF_ENV}"
        ${PLATFORM}=    Evaluate    "${PIC_PLATFORM}"
        Set Global Variable    ${ENV}
        Set Global Variable    ${PLATFORM}
    END
    BuiltIn.Log To Console    ENV=${ENV}
    BuiltIn.Log To Console    WEB-PLATFORM=${PLATFORM}
    BuiltIn.Log To Console    WEB-SCREEN=${SCREEN}
    BuiltIn.Run Keyword If    '''${PLATFORM}''' not in '''${PLATFORMS_ALLOWED}'''    BuiltIn.Fail    PLATFORM_NOT_ALLOWED 
    ${SCREENS_ALLLOWED}    Get Dictionary Keys    ${SCREEN_SIZES_ALLOWED}
    BuiltIn.Run Keyword If    '''${SCREEN}''' not in '''${SCREENS_ALLLOWED}'''    BuiltIn.Fail    SCREEN_NOT_ALLOWED 
    

Suite Teardown
    BuiltIn.Log To Console    END SUITE

Test Setup
    BuiltIn.Log To Console    ${EMPTY}
    BuiltIn.Log To Console    START TEST    
    # Pour les tests WEB ouvrir le navigateur sur les tests qui ont un TAG WEB   
    ${isTestWEB}    BuiltIn.Evaluate    """WEB""" in """${TEST TAGS}"""
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword    SELENIUM.Open ${PLATFORM} 
    ${SCREEN_SIZE}    Get From Dictionary    ${SCREEN_SIZES_ALLOWED}    ${SCREEN}
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword    SELENIUM.Init Conf    screen=${SCREEN_SIZE}

Test Teardown
    BuiltIn.Log To Console    fwk_test_teardown
    # Pour les tests WEB faire une capture d ecran et capture du source html en cas de failed
    # Pour les tests WEB fermer le navigateur 
    ${isTestWEB}    BuiltIn.Evaluate    """WEB""" in """${TEST TAGS}"""    
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword If Test Failed    SELENIUM.Capture Step ScreenShot    ERROR
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword If Test Failed    SELENIUM.Capture Step Html Source    ERROR
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword    SELENIUM.Close Browsers
    
