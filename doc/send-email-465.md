# send email 465

send email with implict ssl is not a standard and not supported by the SmtpClient standard library

if you can't use other authentication system a solution, compatibile with net core, is to use [MailKit](https://github.com/jstedfast/MailKit)

## example

```csharp
var message = new MimeMessage();
message.From.Add(new MailboxAddress("fromname", "my@sample.com"));
message.To.Add(new MailboxAddress("toname", "to@sample.com"));
message.Subject = "subj";

var html = new TextPart(TextFormat.Html);
html.Text = "<b>bold</b> normal";
message.Body = html;

using (var client = new MailKit.Net.Smtp.SmtpClient())
{
    client.Connect("smtps.example.com", 465, true);

    client.Authenticate("fromuser", "frompass");

    client.Send(message);
    client.Disconnect(true);
}
```
