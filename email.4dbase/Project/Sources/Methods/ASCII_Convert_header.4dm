//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$2;$0)

$params:=Count parameters:C259

If ($params>1)
	$headerName:=$1
	$text:=$2
	$0:=$headerName+": "+ASCII_Encode_header ($headerName;$text)
End if 