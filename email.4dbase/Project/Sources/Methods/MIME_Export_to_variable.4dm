//%attributes = {"invisible":true,"shared":true}
C_OBJECT:C1216($1;$message)
$message:=$1

$params:=Count parameters:C259

ASSERT:C1129($params#0)

C_TEXT:C284($0;$MIME)

If (OB Is defined:C1231($message))
	
	ARRAY OBJECT:C1221($headers;0)
	OB GET ARRAY:C1229($message;"headers";$headers)
	
	ARRAY OBJECT:C1221($attachments;0)
	OB GET ARRAY:C1229($message;"attachments";$attachments)
	
	C_TEXT:C284($boundary;$boundary2)
	
	$body:=OB Get:C1224($message;"body";Is object:K8:27)
	$charset:=OB Get:C1224($body;"charset")
	
	$plain:=OB Get:C1224($body;"plain")
	$html:=OB Get:C1224($body;"html")
	
	$lp:=OB Get:C1224($plain;"size";Is longint:K8:6)
	$lh:=OB Get:C1224($html;"size";Is longint:K8:6)
	
	OB GET ARRAY:C1229($message;"headers";$headers)
	$MIME:=MIME_Export_headers (->$headers)
	
	If (Size of array:C274($attachments)=0)
		
		Case of 
			: ($lp#0) & ($lh=0)  //plain
				
				$ContentTransferEncoding:=OB Get:C1224($plain;"content-transfer-encoding")
				$contentType:="text/plain; charset="+$charset+"; format=flowed; delsp=yes"
				
				$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
				$MIME:=$MIME+"\r\nContent-Type: "+$contentType
				$MIME:=$MIME+"\r\n\r\n"
				$MIME:=$MIME+OB Get:C1224($plain;"data")
				
			: ($lp=0) & ($lh#0)  //html
				
				$ContentTransferEncoding:=OB Get:C1224($html;"content-transfer-encoding")
				$contentType:="text/html; charset="+$charset
				
				$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
				$MIME:=$MIME+"\r\nContent-Type: "+$contentType
				$MIME:=$MIME+"\r\n\r\n"
				$MIME:=$MIME+OB Get:C1224($html;"data")
				
			Else 
				
				$contentType:=OB Get:C1224($message;"content-type")
				
				$boundary:=Replace string:C233(Generate UUID:C1066;"-";"";*)
				$MIME:=$MIME+"\r\nContent-Type: "+$contentType+"; \r\n\tboundary="+$boundary
				$MIME:=$MIME+"\r\n\r\n--"+$boundary
				
				$contentType:="multipart/alternative"
				$boundary2:=Replace string:C233(Generate UUID:C1066;"-";"";*)
				$MIME:=$MIME+"\r\nContent-Type: "+$contentType+"; \r\n\tboundary="+$boundary2
				
				$ContentTransferEncoding:=OB Get:C1224($plain;"content-transfer-encoding")
				$format:="; format=flowed"
				$delsp:="; delsp=yes"
				$contentType:="text/plain; charset="+$charset+$format+$delsp
				
				$MIME:=$MIME+"\r\n\r\n--"+$boundary2
				$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
				$MIME:=$MIME+"\r\nContent-Type: "+$contentType
				$MIME:=$MIME+"\r\n\r\n"+OB Get:C1224($plain;"data")
				
				$ContentTransferEncoding:=OB Get:C1224($html;"content-transfer-encoding")
				$contentType:="text/html; charset="+$charset
				
				$MIME:=$MIME+"\r\n\r\n--"+$boundary2
				$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
				$MIME:=$MIME+"\r\nContent-Type: "+$contentType
				$MIME:=$MIME+"\r\n\r\n"+OB Get:C1224($html;"data")
				$MIME:=$MIME+"\r\n\r\n--"+$boundary2+"--"
				$MIME:=$MIME+"\r\n\r\n--"+$boundary+"--"
				
		End case 
		
	Else 
		
		$contentType:=OB Get:C1224($message;"content-type")
		
		$boundary:=Replace string:C233(Generate UUID:C1066;"-";"";*)
		$MIME:=$MIME+"\r\nContent-Type: "+$contentType+"; \r\n\tboundary="+$boundary
		$MIME:=$MIME+"\r\n\r\n--"+$boundary
		
		$contentType:="multipart/alternative"
		$boundary2:=Replace string:C233(Generate UUID:C1066;"-";"";*)
		$MIME:=$MIME+"\r\nContent-Type: "+$contentType+"; \r\n\tboundary="+$boundary2
		
		$ContentTransferEncoding:=OB Get:C1224($plain;"content-transfer-encoding")
		$format:="; format=flowed"
		$delsp:="; delsp=yes"
		$contentType:="text/plain; charset="+$charset+$format+$delsp
		
		$MIME:=$MIME+"\r\n\r\n--"+$boundary2
		$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
		$MIME:=$MIME+"\r\nContent-Type: "+$contentType
		$MIME:=$MIME+"\r\n\r\n"+OB Get:C1224($plain;"data")
		
		$ContentTransferEncoding:=OB Get:C1224($html;"content-transfer-encoding")
		$contentType:="text/html; charset="+$charset
		
		$MIME:=$MIME+"\r\n\r\n--"+$boundary2
		$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
		$MIME:=$MIME+"\r\nContent-Type: "+$contentType
		$MIME:=$MIME+"\r\n\r\n"+OB Get:C1224($html;"data")
		$MIME:=$MIME+"\r\n\r\n--"+$boundary2+"--"
		
	End if 
	
	ARRAY OBJECT:C1221($attachments;0)
	OB GET ARRAY:C1229($message;"attachments";$attachments)
	
	For ($i;1;Size of array:C274($attachments))
		$MIME:=$MIME+"\r\n\r\n--"+$boundary
		$attachment:=$attachments{$i}
		$data:=OB Get:C1224($attachment;"data")
		$contentType:=OB Get:C1224($attachment;"content-type")
		$ContentDisposition:=OB Get:C1224($attachment;"content-disposition")
		$ContentTransferEncoding:=OB Get:C1224($attachment;"content-transfer-encoding")
		$ContentId:=OB Get:C1224($attachment;"content-id")
		
		$MIME:=$MIME+"\r\nContent-Transfer-Encoding: "+$ContentTransferEncoding
		$MIME:=$MIME+"\r\nContent-Type: "+$contentType
		
		$fileName:=OB Get:C1224($attachment;"filename")
		$size:=OB Get:C1224($attachment;"size";Is text:K8:3)
		$charset:=OB Get:C1224($attachment;"charset")
		
		Case of 
			: ($charset="us-ascii") | ($charset="")
				$fileName:=ASCII_Convert_file_name ($fileName)
			Else 
				$fileName:=BASE64_Convert_file_name ($fileName;$charset)
		End case 
		
		$MIME:=$MIME+"\r\nContent-Disposition: "+$ContentDisposition+"; "+$fileName+"; \r\n\tsize="+$size
		If (Length:C16($ContentId)#0)
			$MIME:=$MIME+"\r\nContent-ID: <"+$ContentId+">"
		End if 
		
		$MIME:=$MIME+"\r\n\r\n"+$data
	End for 
	
	$MIME:=$MIME+"\r\n\r\n"
	
	If (Length:C16($boundary)#0)
		
		$MIME:=$MIME+"--"+$boundary+"--"
		
	End if 
	
End if 

$0:=$MIME