*** Settings ***
Resource    ../SOCLE/baseSocle.robot
*** Keywords ***
TestSetup
    BuiltIn.Import Resource    ${CURDIR}/Env/ENV_${ENV}.robot 
    BuiltIn.Import Resource    ${CURDIR}/Data/DATA_${ENV}.robot 
    baseSocle.Test Setup
    
TestTeardown
    baseSocle.Test Teardown

SuiteSetup
    baseSocle.Suite Setup

SuiteTeardown
    baseSocle.Suite Teardown