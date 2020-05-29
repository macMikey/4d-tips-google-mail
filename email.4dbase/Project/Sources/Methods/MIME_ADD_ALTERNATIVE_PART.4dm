//%attributes = {"invisible":true,"shared":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2;$3;$4;$charset)

$params:=Count parameters:C259

ASSERT:C1129($params>2)

$message:=$1

If ($params>3)
	$charset:=Trim ($4)
End if 

If (Length:C16($charset)=0)
	$charset:=OB Get:C1224($message;"charset")
End if 

If (OB Is defined:C1231($message))
	
	C_OBJECT:C1216($body;$plain;$html)
	
	$body:=OB Get:C1224($message;"body";Is object:K8:27)
	$plain:=OB Get:C1224($body;"plain";Is object:K8:27)
	$html:=OB Get:C1224($body;"html";Is object:K8:27)
	
	C_BLOB:C604($data)
	C_TEXT:C284($encodedText)
	
	CONVERT FROM TEXT:C1011($2;$charset;$data)
	BASE64 ENCODE:C895($data;$encodedText)
	$size:=Length:C16($2)
	
	If (Length:C16($encodedText)#0)
		OB SET:C1220($plain;"data";$encodedText)
		OB SET:C1220($plain;"size";$size)
		OB SET:C1220($plain;"content-transfer-encoding";"base64")
		OB SET:C1220($body;"plain";$plain)
	End if 
	
	CONVERT FROM TEXT:C1011($3;$charset;$data)
	BASE64 ENCODE:C895($data;$encodedText)
	$size:=Length:C16($3)
	
	If (Length:C16($encodedText)#0)
		OB SET:C1220($html;"data";$encodedText)
		OB SET:C1220($html;"size";$size)
		OB SET:C1220($html;"content-transfer-encoding";"base64")
		OB SET:C1220($body;"html";$html)
	End if 
	
	OB SET:C1220($body;"charset";$charset)
	OB SET:C1220($message;"body";$body)
	
End if 