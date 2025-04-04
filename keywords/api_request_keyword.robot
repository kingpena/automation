*** Keywords ***

Send POST Request With Body
    [Arguments]   ${API_ENDPOINT}  ${DATA}
    Create Session    mysession    ${PROSPEND_LUCIFER_URL}
    ${headers}    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=  POST On Session  mysession  ${API_ENDPOINT}  data=${DATA}  headers=${headers}  cookies=${COOKIES}
    [Return]  ${response}

Send GET Request With Param
    [Arguments]   ${API_ENDPOINT}  ${PARAMS}
    Create Session    mysession    ${PROSPEND_LUCIFER_URL}
    ${headers}    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=  POST On Session  mysession  ${API_ENDPOINT}  params=${PARAMS}  headers=${headers}  cookies=${COOKIES}
    [Return]  ${response}