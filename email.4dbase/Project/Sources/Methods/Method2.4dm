//%attributes = {}
$charset:="utf-8"
$message:=MIME_New ("multipart/related";$charset)

MIME_ADD_HEADER ($message;"From";"MIYAKO <keisuke.miyako@4d.com>")
MIME_ADD_HEADER ($message;"To";"MIYAKO <keisuke.miyako@4d.com>")
MIME_ADD_HEADER ($message;"Subject";"test_"+Generate UUID:C1066)

$image:=Get_resource_image ("summit.png")

MIME_ADD_PART ($message;->$image;"logo.png";"image/png";$charset;"img1";"inline")

$plain:="plain message"
$html:="<html><body><strong>html</strong><img src=\"cid:img1\" />message</body></html>"

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