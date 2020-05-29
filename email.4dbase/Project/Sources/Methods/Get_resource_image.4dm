//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_PICTURE:C286($0)

$path:=Get 4D folder:C485(Current resources folder:K5:16)+$1

If (Test path name:C476($path)=Is a document:K24:1)
	
	READ PICTURE FILE:C678($path;$0)
	
End if 