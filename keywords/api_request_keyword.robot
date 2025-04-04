*** Keywords ***

Send POST Request With Body
    [Arguments]   ${API_ENDPOINT}  ${DATA}
    ${response}=  POST On Session  mysession  ${API_ENDPOINT}  data=${DATA}  headers=${HEADERS}  cookies=${COOKIES}
    [Return]  ${response}