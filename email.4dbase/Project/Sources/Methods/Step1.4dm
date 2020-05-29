//%attributes = {}
  //#STEP.1:Authorization

$clientId:=Gmail client ID
$endpoint:=Gmail endpoint authentication
$scope:=Gmail scope full access

$url:=$endpoint+\
"?scope="+URL_Escape ($scope)+\
"&client_id="+$clientId+\
"&response_type=code"+\
"&redirect_uri=urn:ietf:wg:oauth:2.0:oob"

OPEN URL:C673($url;*)

TRACE:C157

<>authorizationCode:=Get text from pasteboard:C524