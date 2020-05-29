//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_TEXT:C284($0;$MIME)

ARRAY OBJECT:C1221($headers;0)
  //%w-518.1
COPY ARRAY:C226($1->;$headers)
  //%w+518.1

For ($i;1;Size of array:C274($headers))
	If (Length:C16($MIME)#0)
		$MIME:=$MIME+"\r\n"
	End if 
	$header:=$headers{$i}
	$name:=OB Get:C1224($header;"name";Is text:K8:3)
	$value:=OB Get:C1224($header;"value";Is text:K8:3)
	$charset:=OB Get:C1224($header;"charset";Is text:K8:3)
	Case of 
		: ($charset="us-ascii") | ($charset="")
			$encodedText:=ASCII_Convert_header ($name;$value)
		Else 
			$encodedText:=BASE64_Convert_header ($name;$value;$charset)
	End case 
	$MIME:=$MIME+$encodedText
End for 

$0:=$MIME