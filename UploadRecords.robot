*** Settings ***
Documentation   Upload Excel Records to Robocloud WorkItems
Library    RPA.Browser.Selenium
Library    RPA.HTTP
Library    RPA.Robocorp.WorkItems
Library    RPA.Excel.Files


*** Variables ***
${URL}=  https://www.rpachallenge.com/
${File}=  %{ROBOT_ROOT}/data.xlsx

*** Tasks ***
Upload Data
    #Open Available Browser  ${URL}  options=add_argument("--ignore-certificate-errors") 
    RPA.HTTP.Download  url=https://www.rpachallenge.com/assets/downloadFiles/challenge.xlsx  target_file=${File}  overwrite=True  verify=False
    Open Workbook    ${File}
    ${sheetname}=  Get Active Worksheet
    LOG  ${sheetname}
    ${data}=  Read Worksheet As Table  name=${sheetname}  header=True
    FOR    ${row}    IN    @{data}
        Create Output Work Item
        Set Work Item Variable  Firstname  ${row}[First Name]
        Set Work Item Variable  Lastname  ${row}[Last Name]
        Set Work Item Variable  Companyname  ${row}[Company Name]
        Set Work Item Variable  Role  ${row}[Role in Company]
        Set Work Item Variable  Address  ${row}[Address]
        Set Work Item Variable  Email  ${row}[Email]
        Set Work Item Variable  Phone  ${row}[Phone Number]
        Save Work Item
    END
    Close Workbook
    Close All Browsers
