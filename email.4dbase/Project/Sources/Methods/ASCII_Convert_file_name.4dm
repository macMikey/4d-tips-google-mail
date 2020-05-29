//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$0)

$params:=Count parameters:C259

If ($params#0)
	$headerName:=""
	$text:=$1
	$0:="filename=\r\n\t\""+ASCII_Encode_header ($headerName;$text)+"\""
End if 