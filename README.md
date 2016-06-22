# 4d-tips-google-mail
4D v15でGmail (OAuth2) を送信する例題です。

##単純なSMTPの例

**注記**: Gmailのパスワードは``Resources/accounts-private.xlf``に記述してください。

```xml
<trans-unit d4:value="ここ" id="A443DC2BB7DA4D1B83919BC64966856E.2">
  <source>Account password for Gmail</source>
</trans-unit>
```

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
