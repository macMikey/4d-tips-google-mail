//%attributes = {}
If (True:C214)
	$hostName:="exchange.4d.com"
	$from:="keisuke.miyako@4d.com"
	$to:="keisuke.miyako@4d.com"
	$user:="keisuke.miyako"
	$password:=Account password for 4D
	$useSSL:=0  //STARTTLS
	$port:=587
	$protocol:=2
Else 
	$hostName:="smtp.gmail.com"
	$from:="miyako.keisuke@gmail.com"
	$to:="keisuke.miyako@4d.com"
	$user:="miyako.keisuke"
	$password:=Account password for Gmail
	$useSSL:=1  //SMTP over SSL
	$port:=465
	$protocol:=12
End if 

$subject:="test_"+Generate UUID:C1066

$templateParh:=Get 4D folder:C485(Current resources folder:K5:16)+"document.shtm"
$imagePath:=Get 4D folder:C485(Current resources folder:K5:16)+"summit.png"

$template:=Document to text:C1236($templateParh;"utf-8")

C_OBJECT:C1216($params)
OB SET:C1220($params;"message";"4D Summit 2016")
OB SET:C1220($params;"image";"summit_logo")

PROCESS 4D TAGS:C816($template;$template;$params)

$body:=$template

$error:=SMTP_SetPrefs (1;15;0)
$error:=SMTP_Charset (1;1)

$error:=SMTP_New ($smtpId)
If (0=$error)
	Case of 
		: (0#IT_SetPort ($protocol;$port))
		: (0#SMTP_Host ($smtpId;$hostName))
		: (0#SMTP_From ($smtpId;$from))
		: (0#SMTP_To ($smtpId;$to))
		: (0#SMTP_Subject ($smtpId;$subject))
			  //the following 2 lines can be replaced with SMTP_Body
			  //: (0#SMTP_AddHeader ($smtpId;"Content-Type";"text/html; charset=utf-8";0))
			  //: (0#SMTP_Body ($smtpId;$body))
		: (0#SMTP_Body ($smtpId;$body;4))
		: (0#SMTP_Attachment ($smtpId;$imagePath;2;0;"summit_logo";"image/png"))
		: (0#SMTP_Auth ($smtpId;$user;$password))
		Else 
			
			$error:=SMTP_Send ($smtpId;$useSSL)
			$errorText:=IT_ErrorText ($error)
			
	End case 
	$error:=SMTP_Clear ($smtpId)
End if 