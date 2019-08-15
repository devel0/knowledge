# send email wrapper

*[networking](../README.md#networking)*

## purpose

- use [sendmail.js](https://www.npmjs.com/package/sendmail) to send an email from command line

## howto

- create a clear text password of a sender account `/security/mail/server@example.com` ( must 600 mode )

- install sendmail.js

```
cd /scripts
mkdir sendmail.js
npm install sendmail --save
```

- create a customized invoker `/scripts/sendmail.js/test.js`

```js
'use strict';

if (process.argv.length < 6) {
	console.log('sendemail <from> <to> <subject> <html> <text>');
	console.log('');
	console.log('example: <from> = "display name <email>"');
	console.log('         <to> = "<email1>, <email2>"');
	return;
}

let arg_from=process.argv[2];
let arg_to=process.argv[3];
let arg_subj=process.argv[4];
let arg_html=process.argv[5];
let arg_text='';
if (process.argv.length>6) arg_text=process.argv[6];

const nodemailer = require('nodemailer');

var fs = require('fs');

fs.readFile('/security/mail/server@example.com', 'utf8', (err,data) => {
	if (err)
	{
		console.log('err [' + err + ']');
		return;
	}
	let passw=data.split('\n')[0];

// create reusable transporter object using the default SMTP transport
let transporter = nodemailer.createTransport({
	host: 'mail.example.com',
	port: 465,
	secure: true,
	ignoreTLS: false,
	requireTLS: true,
	auth: {
		type: 'login',
		user: 'server@example.com',
		pass: passw
	},
	tls: {
		rejectUnauthorized: false
	}
});

transporter.verify(function(error, success) {
   if (error) {
        console.log('err' + error);
   } else {
        console.log('Server is ready to take our messages');
   }
});

//console.log("arg html: [" + arg_html + "]");

// setup email data with unicode symbols
let mailOptions = {
    from: arg_from,
    to: arg_to,
    subject: arg_subj,
    text: arg_text,
    html: arg_html
};

console.log('send mail from [' + arg_from + '] to [' + arg_to + ']');

// send mail with defined transport object
transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
        return console.log(error);
    }
    console.log('Message %s sent: %s', info.messageId, info.response);
});

});
```

- create a shell wrapper `/scripts/sendemail`

```sh
#!/bin/bash

dst=selfcheck@example.com

if [ "x$2" == "x" ]; then
	echo "[Send email to $dst]"
	echo "$0 <subject> <html-message>"
	exit 1
fi

/scripts/_sendemail "server@example.com" $dst "$1" "$2"
```

## usage

- invoke through `/scripts/sendemail` <subject> <html-message> ( using default server@example.com from account and selfcheck@example.com destination )
- or through specific `/scripts/_sendemail`
