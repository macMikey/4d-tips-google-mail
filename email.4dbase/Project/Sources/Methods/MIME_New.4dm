//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284(${1})

$params:=Count parameters:C259

C_TEXT:C284($contentType;$charset)

If ($params#0)
	$contentType:=Trim ($1)
End if 

If (Length:C16($contentType)=0)
	$contentType:="multipart/mixed"
End if 

If ($params>1)
	$charset:=Trim ($2)
End if 

If (Length:C16($charset)=0)
	$charset:="utf-8"
End if 

$message:=JSON Parse:C1218("{}")
$plain:=OB Copy:C1225($message)
$html:=OB Copy:C1225($message)

C_OBJECT:C1216($body)
OB SET:C1220($body;"plain";$plain)
OB SET:C1220($body;"html";$html)

OB SET:C1220($message;"content-type";$contentType)
OB SET:C1220($message;"charset";$charset)
OB SET:C1220($message;"body";$body)

$0:=$message