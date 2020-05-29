//%attributes = {"invisible":true}
C_TEXT:C284($1;$2;$3;$0)

$headerName:=$1
$headerValue:=$2
$charset:=$3

$size:=Length:C16($headerValue)
$headerNameLength:=Length:C16($headerName)
$prefix:="=?"+$charset+"?B?"
$suffix:="?="
C_LONGINT:C283($maxDataLength)
$maxDataLength:=76-Choose:C955($headerNameLength>3;$headerNameLength;3)-2  //": "
$maxDataLength:=$maxDataLength-Length:C16($prefix+$suffix)
$outputText:=""
$start:=1
$output:=""
Repeat 
	If ($start#1)
		$outputText:=$outputText+"\r\n\t"
	End if 
	C_BLOB:C604($data)
	ON ERR CALL:C155("ICU_ERR")
	$currentMaxDataLength:=$maxDataLength
	$base64MaxLength:=$maxDataLength/(4/3)
	$again:=False:C215
	Repeat 
		If ($again)
			$currentMaxDataLength:=$currentMaxDataLength-1
		End if 
		CONVERT FROM TEXT:C1011(Substring:C12($headerValue;$start;$currentMaxDataLength);$charset;$data)
		$again:=True:C214
	Until (BLOB size:C605($data)<$base64MaxLength)
	ON ERR CALL:C155("")
	If (OK=1)
		BASE64 ENCODE:C895($data;$output)
	End if 
	$outputText:=$outputText+$prefix+$output+$suffix
	$start:=$start+$currentMaxDataLength
Until ($start>$size)

$0:=$outputText