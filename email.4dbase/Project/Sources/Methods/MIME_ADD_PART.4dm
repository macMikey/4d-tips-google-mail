//%attributes = {"invisible":true,"shared":true}
C_OBJECT:C1216($1)
C_POINTER:C301($2)
C_TEXT:C284(${3};$fileName;$mimeType;$charset;$contentId;$contentDisposition)

$params:=Count parameters:C259

ASSERT:C1129($params>3)
ASSERT:C1129(Not:C34(Is nil pointer:C315($2)))

$message:=$1
$fileName:=$3
$mimeType:=$4

If ($params>4)
	$charset:=Trim ($5)
End if 

If ($params>5)
	$contentId:=$6
End if 

If ($params>6)
	$contentDisposition:=$7
End if 

If (Length:C16($charset)=0)
	$charset:=OB Get:C1224($message;"charset")
End if 

If (Length:C16($contentDisposition)=0)
	$contentDisposition:="inline"
End if 

If (OB Is defined:C1231($message))
	ARRAY OBJECT:C1221($attachments;0)
	OB GET ARRAY:C1229($message;"attachments";$attachments)
	If ($params>1)
		
		C_BLOB:C604($data)
		C_TEXT:C284($encodedText)
		C_LONGINT:C283($size)
		C_TEXT:C284($type)
		
		Case of 
			: (Type:C295($2->)=Is picture:K8:10)
				PICTURE TO BLOB:C692($2->;$data;$mimeType)
				BASE64 ENCODE:C895($data;$encodedText)
				$size:=Picture size:C356($2->)
			: (Type:C295($2->)=Is text:K8:3)
				CONVERT FROM TEXT:C1011($2->;$charset;$data)
				BASE64 ENCODE:C895($data;$encodedText)
				$size:=Length:C16($2->)
			: (Type:C295($2->)=Is BLOB:K8:12)
				BASE64 ENCODE:C895($2->;$encodedText)
				$size:=BLOB size:C605($2->)
		End case 
	End if 
	
	If (Length:C16($encodedText)#0)
		C_OBJECT:C1216($attachment)
		OB SET:C1220($attachment;"data";$encodedText)
		OB SET:C1220($attachment;"content-type";$mimeType)
		OB SET:C1220($attachment;"content-id";$contentId)
		OB SET:C1220($attachment;"content-disposition";$contentDisposition)
		OB SET:C1220($attachment;"content-transfer-encoding";"base64")
		OB SET:C1220($attachment;"filename";$fileName)
		OB SET:C1220($attachment;"size";$size)
		OB SET:C1220($attachment;"charset";$charset)
		APPEND TO ARRAY:C911($attachments;$attachment)
		OB SET ARRAY:C1227($message;"attachments";$attachments)
	End if 
End if 