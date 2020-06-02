# 4d-tips-google-mail

This is an example of sending Gmail (OAuth2) with 4D v15.

## Simple SMTP example

Note: Please write your Gmail password in ``Resources / accounts-private.xlf``.
```xml
<trans-unit d4: value = "here" id = "A443DC2BB7DA4D1B83919BC64966856E.2">
  <source> Account password for Gmail </ source>
</ trans-unit>
```
### Method0

Send standard text emails normally with ``SMTP_Send`` or ``SMTP_QuickSend``.

### Method1

Send HTML mail (with attachment) as usual with ``SMTP_Send`` or ``SMTP_QuickSend``.

### Method3

Send an HTML mail (with attachment) with ``SMTP_QuickSend``.

## OAUTH2 example

Note: Please describe Google API key in *Resources / api-private.xlf*.
```xml
<group d4: groupName = "60670566F9714E2588CB0F737EF578F5" restype = "x-4DK #">
  <trans-unit d4: value = "here" id = "60670566F9714E2588CB0F737EF578F5.1">
    <source> Gmail client ID </ source>
  </trans-unit>
  <trans-unit d4: value = "here" id = "60670566F9714E2588CB0F737EF578F5.2">
    <source> Gmail client secret </source>
  </trans-unit>
</group>
```
### Step1

Start your browser and get the authorization code.

### Step2

Use the authorization code to get an access / refresh token.

### Step3

Use the access token to send the email.

### Step4

Send the email using the refresh token.
