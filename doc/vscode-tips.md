# vscode tips

<!-- TOC -->
* [keys](#keys)
* [debug with chrome and extensions](#debug-with-chrome-and-extensions)
* [watch string unescaped](#watch-string-unescaped)
* [develop and debugging with root privileges](#develop-and-debugging-with-root-privileges)
* [set git copy remote url](#set-git-copy-remote-url)
* [add languageid override](#add-languageid-override)
* [snippets](#snippets)
<!-- TOCEND -->

<hr/>

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

another crude hack is the following editing directly `/opt/google/chome` toward end of file ( it enabled extension for user `devel0` when `remote-debugging-port` argument used such as from configuration types `chrome` or `coreclr` with `ServerReadyAction / debugWithChrome`

```sh
# Note: exec -a below is a bashism.
if [ "$USER" == "devel0" ]; then
#       echo "$@" > /tmp/log1
        if [ "$(echo $@ | grep remote-debugging-port)" != "" ]; then                
                extpath=$HOME/.config/google-chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi
                v=$(ls $extpath)
                exec -a "$0" "$HERE/chrome" \
                        --load-extension=$extpath/$v/ \
                        "$@"
        else
                exec -a "$0" "$HERE/chrome" "$@"
        fi
else
        exec -a "$0" "$HERE/chrome" "$@"
fi
```

## watch string unescaped

To copy watched string variable with unescaped characters ( for example if contains newlines default Copy value retrieve a string with `\n\r` instead of unescaped newline ) append `,nq` ( no quote ) modifier to the watched variable name ( eg. `obj.Message,nq` )

## develop and debugging with root privileges

code suggest to run as user mode; of course if you need to develop some tool around some other that need privileges you can invoke these through sudo; to avoid terminal interaction in inserting password for sudo privileges for some specific commands edit sudo table by adding an auxiliary file into `/etc/sudoers.d` for example `/etc/sudoers.d/devel0` with follow content:

```
devel0 ALL = NOPASSWD: /bin/btrfs
```

this will allow devel0 to exec `btrfs` tool without password ask when invoked through `sudo`

## set git copy remote url

this will allow you to use right click -> copy remote url feature that copy to clipboard permalink to code selection

in settings.json

```json
{
    "gitlens.remotes": [
        {
            "domain": "git.searchathing.com",
            "type": "GitLab"
        }
    ]
}
```

## add languageid override

to allow XmlComplete recognize `axaml` as xml add follow to settings.json

```json
    "files.associations": {
        "*.axaml": "xml"
    },
```

## snippets

- see [easy snippet](https://marketplace.visualstudio.com/items?itemName=inu1255.easy-snippet) extension
- ref: [variable transform](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_variable-transforms)

snippets will located in `~/.config/Code/User/snippets/csharp.json` and automatically managed by easy snippet extension

example for a snippet ( avalonia property )

```csharp
private $1 ${2} = $3;
public $1 ${2/(.)/${1:/upcase}/}
{
    get => $2;
    set => this.RaiseAndSetIfChanged(ref $2, value);
}
```

just recall the snippet with the name assigned from easy snippet then enter var name ( first letter lowercase ) then the public prop will uppercased automatically when hit tab.
