*** Keywords ***

Send POST Request With Body
    [Arguments]   ${API_ENDPOINT}  ${DATA}
    ${headers}    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=  POST On Session  mysession  ${API_ENDPOINT}  data=${DATA}  headers=${headers}  cookies=${COOKIES}
    [Return]  ${response}