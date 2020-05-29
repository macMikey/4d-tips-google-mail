//%attributes = {"invisible":true}
C_TEXT:C284($1;$0;$fileName)

$params:=Count parameters:C259

ASSERT:C1129($params#0)

$path:=$1

ARRAY LONGINT:C221($pos;0)
ARRAY LONGINT:C221($len;0)

If (Folder separator:K24:12=":")
	$motif:="(?:.*:)?(.+$)"
Else 
	$motif:="(?:.*\\\\)?(.+$)"
End if 

If (Match regex:C1019($motif;$path;1;$pos;$len))
	$fileName:=Substring:C12($path;$pos{1};$len{1})
	If (Folder separator:K24:12=":")
		$fileName:=Replace string:C233($fileName;"/";":")
	End if 
End if 

$0:=$fileName