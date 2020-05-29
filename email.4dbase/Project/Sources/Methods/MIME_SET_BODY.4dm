//%attributes = {"invisible":true,"shared":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2;$body)

$params:=Count parameters:C259

ASSERT:C1129($params#0)

$message:=$1

If (OB Is defined:C1231($message))
	
	If ($params>1)
		OB SET:C1220($message;"body";$2)
	End if 
	
End if 