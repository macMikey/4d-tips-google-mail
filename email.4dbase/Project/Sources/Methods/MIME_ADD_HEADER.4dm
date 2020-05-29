//%attributes = {"invisible":true,"shared":true}
C_OBJECT:C1216($1)
C_TEXT:C284(${2};$name;$value)

$params:=Count parameters:C259

ASSERT:C1129($params#0)

$message:=$1

If (OB Is defined:C1231($message))
	
	ARRAY OBJECT:C1221($headers;0)
	OB GET ARRAY:C1229($message;"headers";$headers)
	
	$charset:=OB Get:C1224($message;"charset")
	
	If ($params>1)
		$name:=Trim ($2)
		If ($params>2)
			$value:=$3
			If ($params>3)
				$charset:=Trim ($4)  //give possibility to override for this header
			End if 
		End if 
	End if 
	
	C_OBJECT:C1216($header)
	OB SET:C1220($header;"name";$name)
	OB SET:C1220($header;"value";$value)
	
	If (Not:C34(Match regex:C1019("\\p{InBasic_Latin}+";$value)))
		OB SET:C1220($header;"charset";$charset)
	End if 
	
	APPEND TO ARRAY:C911($headers;$header)
	OB SET ARRAY:C1227($message;"headers";$headers)
	
End if 