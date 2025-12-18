*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Resource    ../Config/Dev.resource

*** Keywords ***
Criar Sessao
    ${headers}=        Create Dictionary    Content-Type=application/json
    Create Session     alias=develop     url=${BASE_URL}    headers=${headers}

Realizar login
    ${body}=        Create Dictionary    mail=${username}   password=${password} 
    Criar Sessao
    ${response}=    POST On Session    develop    /login    json=${body}    verify=${True}
    Status Should Be    200    ${response}





