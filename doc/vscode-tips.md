# vscode tips

*[development tools](../README.md#development-tools)*

## keys

| key | descr |
|---|---|
| `shift + cmd + ~` | switch between vscode windows |
| `ctrl + shift + O` | methods list |
| `ctrl + shift + [` | fold region |
| `ctrl + shift + ]` | unfold region |

## debug with chrome and extensions

react developer tools doesn't load until open in global scope browser as result the extension not visible when debugging, to workaround this edit `launch.json` as follow ( you may need to edit your tool extension path in `runtimeArgs`

```json
{   
    "version": "0.2.0",
    "configurations": [                
        {
            "type": "chrome",
            "request": "launch",
            "name": "Launch Chrome against localhost",
            "url": "http://localhost:3000",
            "webRoot": "${workspaceFolder}"    ,
            "runtimeArgs": ["--load-extension=${env:HOME}/.config/google-chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi/4.2.0_0/"]
        }
    ]
}
```

## watch string unescaped

To copy watched string variable with unescaped characters ( for example if contains newlines default Copy value retrieve a string with `\n\r` instead of unescaped newline ) append `,nq` ( no quote ) modifier to the watched variable name ( eg. `obj.Message,nq` )

## develop and debugging with root privileges

code suggest to run as user mode; of course if you need to develop some tool around some other that need privileges you can invoke these through sudo; to avoid terminal interaction in inserting password for sudo privileges for some specific commands edit sudo table by adding an auxiliary file into `/etc/sudoers.d` for example `/etc/sudoers.d/devel0` with follow content:

```
devel0 ALL = NOPASSWD: /bin/btrfs
```

this will allow devel0 to exec `btrfs` tool without password ask when invoked through `sudo`
