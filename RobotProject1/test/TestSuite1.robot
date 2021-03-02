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
    Open Browser       https://www.jimms.fi    chrome
    Set Browser Implicit Wait    5
    Input Text         name=q    i5-9400F
    Press Keys         name=q    ENTER
    Sleep    2
    Close Browser
    Log    Test Completed
    
SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser        ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element       id=welcome
    Click Element       link=Logout
    Close Browser
    Log                 Test Completed
    Log                 This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text          id=txtUsername    @{CREDENTIALS}[0]
    Input Password      id=txtPassword    &{LOGINDATA}[password]
    Click Button        id=btnLogin