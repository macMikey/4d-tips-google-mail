//%attributes = {}
  //#STEP.3:Send

$clientId:=Gmail client ID
$clientSecret:=Gmail client secret
$endpoint:=Gmail endpoint send

$charset:="utf-8"
$message:=MIME_New ("multipart/related";$charset)
MIME_ADD_HEADER ($message;"To";"keisuke.miyako@4d.com")
MIME_ADD_HEADER ($message;"From";"miyako.keisuke@gmail.com")
MIME_ADD_HEADER ($message;"Date";String:C10(Current date:C33;Date RFC 1123:K1:11;Current time:C178))
MIME_ADD_HEADER ($message;"Subject";"test_"+Generate UUID:C1066)

$plain:="plain message"
$html:="<html><body><strong>html</strong><img src=\"cid:img1\" />message</body></html>"

If (True:C214)
	$image:=Get_resource_image ("summit.png")
	CREATE THUMBNAIL:C679($image;$image)  //otherwise exceeds the size limit for raw!
	MIME_ADD_PART ($message;->$image;"logo.png";"image/png";$charset;"img1";"inline")
End if 

Case of 
	: (False:C215)
		  //plain text only
		MIME_ADD_ALTERNATIVE_PART ($message;$plain;"";$charset)
	: (False:C215)
		  //html only
		MIME_ADD_ALTERNATIVE_PART ($message;"";$html;$charset)
	Else 
		  //plain text and html
		MIME_ADD_ALTERNATIVE_PART ($message;$plain;$html;$charset)
End case 

$MIME:=MIME_Export_to_variable ($message)

TEXT TO DOCUMENT:C1237(System folder:C487(Desktop:K41:16)+Current method name:C684+".eml";$MIME;"us-ascii")

C_BLOB:C604($mimeData)
C_TEXT:C284($raw)
CONVERT FROM TEXT:C1011($MIME;"utf-8";$mimeData)
BASE64 ENCODE:C895($mimeData;$raw)

C_OBJECT:C1216($request)
OB SET:C1220($request;"raw";$raw)

ARRAY TEXT:C222($headerNames;1)
ARRAY TEXT:C222($headerValues;1)

$headerNames{1}:="Authorization"
$headerValues{1}:=<>token_type+" "+<>access_token

C_OBJECT:C1216($response)
$status:=HTTP Request:C1158(HTTP POST method:K71:2;$endpoint;$request;$response;$headerNames;$headerValues)

If ($status=200)
	
	$id:=OB Get:C1224($response;"id")
	$threadId:=OB Get:C1224($response;"threadId")
	
	TRACE:C157
	
End if 