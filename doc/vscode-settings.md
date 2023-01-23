# vscode settings

- File/Preferences or file located under `~/.config/Code/User/settings.json`

```json
{
  "window.zoomLevel": 1,
  "git.enableSmartCommit": true,
  "redhat.telemetry.enabled": false,
  "debug.onTaskErrors": "showErrors",
  "workbench.editor.enablePreview": false,
  "explorer.confirmDelete": false,
  "editor.mouseWheelZoom": true,
  "editor.codeLens": false,
  "editor.inlayHints.enabled": "offUnlessPressed",
  "git.confirmSync": false,
  "git.autofetch": true,
  "terminal.integrated.allowChords": false,
  "editor.autoClosingBrackets": "never",
  "editor.formatOnType": true,
  "files.associations": {
    "*.axaml": "xml",
    "*.xaml": "xml",
    "*.gs": "glsl"
  },
  "[xml]": {
    "editor.defaultFormatter": "redhat.vscode-xml"
  },
  "security.workspace.trust.untrustedFiles": "open",
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "explorer.confirmDragAndDrop": false,
  "[glsl]": {
    "editor.defaultFormatter": "xaver.clang-format"
  },
  
}
```

- File/Preferences/Keyboard shortcuts ( `~/.config/Code/User/keybindings.json` )

```json
[
    {
        "key": "ctrl+shift+s",
        "command": "workbench.action.files.saveFiles"
    }
]
```
