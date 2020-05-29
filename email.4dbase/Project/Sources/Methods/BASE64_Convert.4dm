//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$2;$0)
C_BOOLEAN:C305($3;$extended)

$params:=Count parameters:C259

If ($params>1)
	$input:=$1
	$charset:=$2
	If ($params>2)
		$extended:=$3
	End if 
	If ($extended) & (Match regex:C1019("(?i)shift.jis";$charset))
		$internal_charset:="windows-31j"
	Else 
		$internal_charset:=$charset
	End if 
	$output:=""
	C_BLOB:C604($data)
	ON ERR CALL:C155("ICU_ERR")
	CONVERT FROM TEXT:C1011($input;$internal_charset;$data)
	ON ERR CALL:C155("")
	If (OK=1)
		BASE64 ENCODE:C895($data;$output)
	End if 
	$0:=$output
End if 