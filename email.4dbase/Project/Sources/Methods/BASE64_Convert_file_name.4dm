//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$2;$0)
C_BOOLEAN:C305($3;$extended)

$params:=Count parameters:C259

If ($params>1)
	$headerName:=""
	$text:=$1
	$charset:=$2
	If ($params>2)
		$extended:=$3
	End if 
	$0:="filename=\r\n\t\""+BASE64_Encode_header ($headerName;$text;$charset)+"\""
End if 