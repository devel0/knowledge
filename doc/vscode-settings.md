# vscode settings

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
    "git.autofetch": true,
    "workbench.colorCustomizations": {
        "tab.activeBorder": "#ff0000",
        "tab.unfocusedActiveBorder": "#000000"
    },
}
```

- File/Preferences/Keyboard shortcuts ( `~/.config/Code/User/keybindings.json` )

to open and switch between terminals like gnome-terminal ( requires also `"terminal.integrated.allowChords": false` in `settings.json` if want to disable ask for second chord when using eg. `CTRL+R` )

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
