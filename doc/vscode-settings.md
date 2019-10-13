# vscode settings

*[development tools](../README.md#development-tools)*

- File/Preferences or file located under `~/.config/Code/User/settings.json`

```json
{
    "arduino.path": "/home/devel0/softcollect.public/arduino/arduino-1.8.7",
    "arduino.logLevel": "verbose",
    "terminal.integrated.rendererType": "dom",
    "git.enableSmartCommit": true,
    "window.zoomLevel": 0,
    "editor.mouseWheelZoom": true,
    "breadcrumbs.enabled": true,
    "editor.autoClosingBrackets": "never",
    "window.titleBarStyle": "native",
    "csharp.referencesCodeLens.enabled": false,
    "workbench.editor.enablePreview": false,
    "editor.codeLens": false,
    "git.autofetch": true
}
```

- File/Preferences/Keyboard shortcuts ( `~/.config/Code/keybindings.json` )

to open and switch between terminals like gnome-terminal

```json
// Place your key bindings in this file to override the defaultsauto[]
[
    {
        "key": "ctrl+shift+s",
        "command": "workbench.action.files.saveAll"
    },
    {
        "key": "ctrl+pagedown",
        "command": "workbench.action.terminal.focusNext"
    },
    {
        "key": "ctrl+pageup",
        "command": "workbench.action.terminal.focusPrevious"
    },
    {
        "key": "ctrl+shift+t",
        "command": "workbench.action.terminal.new"
    },
    {
        "key": "ctrl+shift+`",
        "command": "-workbench.action.terminal.new"
    }
]
```
