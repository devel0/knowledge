# vscode settings

- File/Preferences or file located under `~/.config/Code/User/settings.json`

```json
{
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
  "window.zoomLevel": 1,
  "[shellscript]": {
    "editor.defaultFormatter": "foxundermoon.shell-format"
  },
  "xml.format.maxLineWidth": 0,
  "markdown.extension.toc.levels": "2..6",
  "editor.stickyScroll.scrollWithEditor": false,
  "workbench.tree.enableStickyScroll": false,  
  "editor.hover.sticky": true
}
```

- File/Preferences/Keyboard shortcuts ( `~/.config/Code/User/keybindings.json` )

```json
[
    {
        "key": "ctrl+shift+s",
        "command": "workbench.action.files.saveFiles"
    },
    {
        "key": "ctrl+shift+t",
        "command": "workbench.action.terminal.new",
        "when": "terminalProcessSupported || terminalWebExtensionContributedProfile"
    },
    {
        "key": "ctrl+shift+`",
        "command": "-workbench.action.terminal.new",
        "when": "terminalProcessSupported || terminalWebExtensionContributedProfile"
    }
]
```
