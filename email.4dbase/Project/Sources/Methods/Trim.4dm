//%attributes = {"invisible":true}
C_TEXT:C284($1)

$params:=Count parameters:C259

ASSERT:C1129($params#0)

$string:=$1

ARRAY LONGINT:C221($pos;0)
ARRAY LONGINT:C221($len;0)

If (Match regex:C1019("(?:^\\s*)(.+?)(?:\\s*$)";$string;1;$pos;$len))
	
	$0:=Substring:C12($string;$pos{1};$len{1})
	
Else 
	
	$0:=$string
	
End if 