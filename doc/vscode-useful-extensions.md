# vscode useful extensions

follow list is generated through this code

```sh
for i in $(ls ~/.vscode/extensions | sed 's#\(.*\)-\([0-9].*\)#\1#g'); do echo "code --install-extension $i"; done
```

```sh
code --install-extension acharluk.easy-cpp-projects
code --install-extension alefragnani.bookmarks
code --install-extension aliasadidev.nugetpackagemanagergui
code --install-extension bbenoist.doxygen
code --install-extension cutetee.qml
code --install-extension dotjoshjohnson.xml
code --install-extension dtoplak.vscode-glsllint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension exodiusstudios.comment-anchors
code --install-extension extensions.json
code --install-extension foxundermoon.shell-format
code --install-extension ho-wan.setting-toggle
code --install-extension inu1255.easy-snippet
code --install-extension k--kato.docomment
code --install-extension mcu-debug.debug-tracker-vscode
code --install-extension mcu-debug.memory-view
code --install-extension mcu-debug.rtos-views
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.blazorwasm-companion
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-python.isort
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
code --install-extension ms-vscode.cmake-tools
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-vscode.remote-explorer
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension natqe.reload
code --install-extension platformio.platformio-ide
code --install-extension przemyslawonak.pimp-my-avalonia
code --install-extension raczzalan.webgl-glsl-editor
code --install-extension redhat.vscode-xml
code --install-extension rogalmic.vscode-xml-complete
code --install-extension slevesque.shader
code --install-extension trottero.dotnetwatchattach
code --install-extension twxs.cmake
code --install-extension xaver.clang-format
code --install-extension yzhang.markdown-all-in-one
code --install-extension takumii.markdowntable
```
