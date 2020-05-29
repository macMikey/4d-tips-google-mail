//%attributes = {}
  //#STEP.2:Get Access token

$clientId:=Gmail client ID
$clientSecret:=Gmail client secret
$endpoint:=Gmail endpoint authorization

$params:="code="+<>authorizationCode+\
"&client_id="+$clientId+\
"&client_secret="+$clientSecret+\
"&grant_type=authorization_code"+\
"&redirect_uri=urn:ietf:wg:oauth:2.0:oob"

C_BLOB:C604($request)
CONVERT FROM TEXT:C1011($params;"utf-8";$request)

ARRAY TEXT:C222($headerNames;1)
ARRAY TEXT:C222($headerValues;1)

$headerNames{1}:="Content-Type"
$headerValues{1}:="application/x-www-form-urlencoded"

C_OBJECT:C1216($response)
$status:=HTTP Request:C1158(HTTP POST method:K71:2;$endpoint;$request;$response;$headerNames;$headerValues)

If ($status=200)
	
	C_TIME:C306($expires_in)
	$expires_in:=Current time:C178+OB Get:C1224($response;"expires_in";Is longint:K8:6)
	
	<>access_token:=OB Get:C1224($response;"access_token")
	<>refresh_token:=OB Get:C1224($response;"refresh_token")
	<>token_type:=OB Get:C1224($response;"token_type")
	
	TRACE:C157
	
End if 