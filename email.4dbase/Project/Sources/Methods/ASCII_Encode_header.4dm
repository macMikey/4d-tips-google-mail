//%attributes = {"invisible":true}
C_TEXT:C284($1;$2;$0)

$headerName:=$1
$headerValue:=$2

  //If (Match regex("[0-9A-Za-z!#$%&*+.^_{-~-]+";$headerValue))
If (Match regex:C1019("\\p{InBasic_Latin}+";$headerValue))
	$size:=Length:C16($headerValue)
	$headerNameLength:=Length:C16($headerName)
	$maxDataLength:=76-Choose:C955($headerNameLength>3;$headerNameLength;3)-2  //": "
	$outputText:=""
	$start:=1
	Repeat 
		If ($start#1)
			$outputText:=$outputText+"\r\n\t"
		End if 
		If ($start#1)
			$outputText:=$outputText+"\r\n\t"
		End if 
		$outputText:=$outputText+Substring:C12($headerValue;$start;$maxDataLength)
		$start:=$start+$maxDataLength
	Until ($start>$size)
	$0:=$outputText
Else 
	$0:=BASE64_Encode_header ($headerName;$headerValue;"utf-8";False:C215)
End if 