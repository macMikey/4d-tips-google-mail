//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$2;$3;$0)

$params:=Count parameters:C259

If ($params>2)
	$headerName:=$1
	$text:=$2
	$charset:=$3
	$0:=$headerName+": "+BASE64_Encode_header ($headerName;$text;$charset)
End if 