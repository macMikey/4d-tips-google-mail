//%attributes = {"invisible":true,"shared":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2;$3)

$params:=Count parameters:C259

ASSERT:C1129($params>2)
ASSERT:C1129(Length:C16($2)#0)

$message:=$1

If (OB Is defined:C1231($message))
	If (Not:C34(OB Get type:C1230($message;"options")=Is object:K8:27))
		OB SET:C1220($message;"options";JSON Parse:C1218("{}"))
	End if 
	C_OBJECT:C1216($options)
	$options:=OB Get:C1224($message;"options";Is object:K8:27)
	OB SET:C1220($options;$2;$3)
End if 