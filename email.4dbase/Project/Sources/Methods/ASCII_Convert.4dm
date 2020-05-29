//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$0)

$params:=Count parameters:C259

If ($params#0)
	$input:=$1
	$FLOW:=Char:C90(SP ASCII code:K15:33)+Char:C90(CR ASCII code:K15:14)+Char:C90(LF ASCII code:K15:11)
	$pos:=0x0001
	$len:=0x03DE
	$size:=Length:C16($input)
	$output:=""
	Repeat 
		If (Length:C16($output)#0)
			$output:=$output+$FLOW
		End if 
		$output:=$output+Substring:C12($input;$pos;$len)
		$pos:=$pos+$len
	Until ($pos>$size)
	$0:=$output
End if 