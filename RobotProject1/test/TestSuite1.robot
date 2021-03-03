*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    Im inside Test Setup
Test Teardown    Log    Im inside Test Teardown

Default Tags    test
*** Test Cases ***
MyFirstTest
    Log    Hello World...
    
FirstSeleniumTest
    OpenJimms
    SearchProduct
    Sort
    ClickElements
    SleepCloseLog
    
SampleLoginTest
    [Documentation]                This is a sample login test
    OpenLogin
    LoginKW
    ClickElements2
    SleepCloseLog
    LogData
    
*** Variables ***
${jimms}    https://www.jimms.fi
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}      Admin             admin123

*** Keywords ***
OpenLogin
    Open Browser                   ${URL}                         chrome
    Set Browser Implicit Wait      5
    
LoginKW
    Input Text          id=txtUsername    @{CREDENTIALS}[0]
    Input Password      id=txtPassword    @{CREDENTIALS}[1]
    Click Button        id=btnLogin
    
SearchProduct
    Input Text                     name=q                  i5-9400F
    Press Keys                     name=q                  ENTER
    
ClickElements
    Click Element                  partial link:i5-9400F
    Click Element                  partial link:Tuotelinkit
    Click Element                  partial link:tuotesivu
    
SleepCloseLog
    Sleep                          2
    Close Browser
    Log                            Test Completed
    
Sort
    Select From List By Label      class:sortselect        Hinta (Pienin-Suurin)
    
OpenJimms
    Open Browser                   ${jimms}    chrome
    Set Browser Implicit Wait      5

ClickElements2                     
    Click Element                  id=welcome
    Click Element                  link=Logout
    
LogData
    Log    This test was executed by %{username} on %{os}