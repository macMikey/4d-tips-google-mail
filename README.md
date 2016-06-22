# 4d-tips-google-mail
4D v15でGmail (OAuth2) を送信する例題です。

##単純なSMTPの例

**注記**: Gmailのパスワードは``Resources/accounts-private.xlf``に記述してください。

```xml
<trans-unit d4:value="ここ" id="A443DC2BB7DA4D1B83919BC64966856E.2">
  <source>Account password for Gmail</source>
</trans-unit>
```

###Method0

``SMTP_Send``または``SMTP_QuickSend``で普通に標準テキストメールを送信します。

###Method1

``SMTP_Send``または``SMTP_QuickSend``で普通にHTMLメール（添付ファイル付き）を送信します。

###Method3

``SMTP_QuickSend``でHTMLメール（添付ファイル付き）を送信します。

##OAUTH2の例

**注記**: GoogleのAPIキーは``Resources/api-private.xlf``に記述してください。

```xml
<group d4:groupName="60670566F9714E2588CB0F737EF578F5" restype="x-4DK#">
  <trans-unit d4:value="ここ" id="60670566F9714E2588CB0F737EF578F5.1">
    <source>Gmail client ID</source>
  </trans-unit>
  <trans-unit d4:value="ここ" id="60670566F9714E2588CB0F737EF578F5.2">
    <source>Gmail client secret</source>
  </trans-unit>
</group>
```

###Step1

ブラウザを起動して認証コードを取得します。

###Step2

認証コードを使用してアクセス/リフレッシュトークンを取得します。

###Step3

アクセストークンを使用してメールを送信します。

###Step4

リフレッシュトークンを使用してメールを送信します。
