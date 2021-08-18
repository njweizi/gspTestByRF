*** Settings ***
Library           SeleniumLibrary
Library           ImageCodePicher/ImageCodePicher.py

*** Variables ***
${url}            http://gsp.chinawayltd.com/login/
&{user_1}         name=Matti    address=afdfdfdf    phone=123    laf=lad    wang=ldjsj    ere=dkjfksa    sldjfl=ered    akfjafj=rerekjek
@{list_value}     akdjfdajf    dfjaljfd;a    kdjlafjd    erierui    dfafda    adsgasg

*** Test Cases ***
case01
    open browser gsp
    login gsp
    Wait Until Element Contains    xpath=//*[@id="ext-comp-1022-xcollapsed"]/span/div    点击菜单
    Click Element    xpath=//*[@id="ext-comp-1022-xcollapsed"]/span/div
    Input Text    xpath=//*[@id="treeSearch"]    终端列表
    Wait Until Element Contains    xpath=//*[@id="ext-gen13"]/li/ul/li[9]/ul/li[6]/div    终端列表
    Click Element    xpath=//*[@id="ext-gen13"]/li/ul/li[9]/ul/li[6]/div
    Sleep    3s
    Click Element    xpath=//*[@id="ext-comp-1022-xcollapsed"]/span/div
    Select Frame    xpath=//*[@id="iframe175"]
    Wait Until Element Is Visible    xpath=//*[@id="ids"]
    Click Element    xpath=//*[@id="ids"]
    Wait Until Page Contains Element    xpath=//*[@id="values"]
    Input Text    xpath=//*[@id="values"]    34016722\n34016766\n34016732\n34016796\n34016774\n34016795\n34016769\n34016731\n34016763\n34016745\n34016726\n34016772\n34016797\n34016798\n34016719\n34016801\n34016804\n34016727\n34016721\n34016733\n34016777\n34016806\n34016799\n34016768\n34016802\n34016794\n34016775\n34016779\n34016747\n34016808\n34016699\n34016780\n34016718\n34016810\n34016812\n34016803\n34016758\n34016739\n34016750\n34016814\n34016809\n34016784\n34016758\n34016800\n34016805\n34016778
    Click Button    xpath=//*[@id="ext-gen392"]
    Sleep    3s
    Click Element    xpath=//*[@id="ext-gen210"]
    Mouse Down    //*[@id="ext-gen414"]/div[5]
    Mouse Up    //*[@id="ext-gen414"]/div[5]
    # Select From List By Value    xpath=//*[@id="ext-comp-1015"]    500
    Sleep    3s
    Wait Until Page Contains Element    xpath=//*[@id="ext-gen174"]/div[1]/table/tbody/tr/td[1]

*** Keywords ***
open browser gsp
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --ignore-urlfetcher-cert-requests
    Call Method    ${options}    add_argument    --ignore-ssl-errors
    log    ${options}
    Comment    Call Method    ${options}    add_argument    --headless
    Create WebDriver    Chrome    chrome_options=${options}
    Go To    ${url}
    #Open Browser    http://gsp.chinawayltd.com/login/    chrome    chrome_options=${options}

login gsp
    Wait Until Page Contains Element    xpath=//*[@id="userName"]    10
    Wait Until Page Contains Element    xpath=//*[@id="passWord"]    10
    Wait Until Page Contains Element    xpath=//*[@id="valCode"]    10
    Wait Until Page Contains Element    xpath=//*[@id="valImg"]    10
    Capture Element Screenshot    xpath=//*[@id="valImg"]    D:\\TEST\\10.png
    ${code}=    ImageCodePicher.get_txt    D:\\TEST\\10.png    ${252}
    Sleep    5s
    log    ${code}
    Input Text    xpath=//*[@id="userName"]    jhyanfa
    Input Password    xpath=//*[@id="passWord"]    jHZN6QLD
    Input Text    xpath=//*[@id="valCode"]    ${code}
    Click Button    xpath=//*[@id="login"]

open page and return
