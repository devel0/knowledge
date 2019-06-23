# vscode tips

## keys

| key | descr |
|---|---|
| `shift + cmd + ~` | switch between vscode windows |
| `ctrl + shift + O` | methods list |
| `ctrl + shift + [` | fold region |
| `ctrl + shift + ]` | unfold region |

## watch string unescaped

To copy watched string variable with unescaped characters ( for example if contains newlines default Copy value retrieve a string with `\n\r` instead of unescaped newline ) append `,nq` ( no quote ) modifier to the watched variable name ( eg. `obj.Message,nq` )
