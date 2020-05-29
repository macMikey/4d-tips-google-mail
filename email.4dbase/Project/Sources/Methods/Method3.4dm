//%attributes = {}
$charset:="utf-8"
$message:=MIME_New ("multipart/related";$charset)

MIME_ADD_HEADER ($message;"MIME-Version";"1.0")

$image:=Get_resource_image ("summit.png")

MIME_ADD_PART ($message;->$image;"logo.png";"image/png";$charset;"img1";"inline")

$plain:="plain message"
$html:="<html><body><strong>html</strong><img src=\"cid:img1\" />message</body></html>"

MIME_ADD_ALTERNATIVE_PART ($message;$plain;$html;$charset)

$MIME:=MIME_Export_to_variable ($message)

TEXT TO DOCUMENT:C1237(System folder:C487(Desktop:K41:16)+Current method name:C684+".eml";$MIME;"us-ascii")

If (True:C214)
	$hostName:="exchange.4d.com"
	$from:="keisuke.miyako@4d.com"
	$to:="keisuke.miyako@4d.com"
	$user:="keisuke.miyako"
	$password:=Account password for 4D
	$param:=8  //MIME+STARTTLS
	$port:=587
Else 
	$hostName:="smtp.gmail.com"
	$from:="miyako.keisuke@gmail.com"
	$to:="keisuke.miyako@4d.com"
	$user:="miyako.keisuke"
	$password:=Account password for Gmail
	$param:=9  //MIME+SMTP over SSL
	$port:=465
End if 

$subject:="test_"+Generate UUID:C1066

$body:=$MIME

$error:=SMTP_SetPrefs (1;15;0)
$error:=SMTP_Charset (1;1)

$error:=SMTP_QuickSend ($hostName;$from;$to;$subject;$body;$param;$port;$user;$password)
$errorText:=IT_ErrorText ($error)
