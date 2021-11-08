*** Settings ***
Documentation   Upload Excel Records to Robocloud WorkItems
Library    RPA.Browser.Selenium
Library    RPA.Robocorp.WorkItems

*** Variables ***
${URL}=  https://www.rpachallenge.com/
${File}=  %{ROBOT_ROOT}/data.xlsx

*** Keywords ***
Fill Form
    Open Available Browser  ${URL}  options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
    Sleep  5
    ${firstname}=  Get Work Item Variable  Firstname
    LOG  ${firstname}
    ${lastname}=  Get Work Item Variable  Lastname
    ${companyname}=  Get Work Item Variable  Companyname
    ${role}=  Get Work Item Variable  Role
    ${address}=  Get Work Item Variable  Address
    ${email}=  Get Work Item Variable  Email
    ${phone}=  Get Work Item Variable  Phone
    Input Text    //input[@ng-reflect-name="labelAddress"]    ${address}
    Input Text    //input[@ng-reflect-name="labelFirstName"]    ${firstname}
    Input Text    //input[@ng-reflect-name="labelLastName"]    ${lastname}
    Input Text    //input[@ng-reflect-name="labelCompanyName"]    ${companyname}
    Input Text    //input[@ng-reflect-name="labelRole"]    ${role}
    Input Text    //input[@ng-reflect-name="labelEmail"]    ${email}
    Input Text    //input[@ng-reflect-name="labelPhone"]    ${phone}
    Sleep  2
    Click Element    //input[@type="submit"]
    Close Browser

*** Tasks ***
Process Data
    Fill Form
