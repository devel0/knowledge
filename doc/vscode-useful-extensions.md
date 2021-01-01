# vscode useful extensions

follow list is generated through this code

```sh
for i in $(ls ~/.vscode/extensions | sed 's#\(.*\)-\([0-9].*\)#\1#g'); do echo "code --install-extension $i"; done
```

```sh
code --install-extension aaron-bond.better-comments
code --install-extension alefragnani.bookmarks
code --install-extension austin.code-gnu-global
code --install-extension bmd.stm32-for-vscode
code --install-extension cschlosser.doxdocgen
code --install-extension dan-c-underwood.arm
code --install-extension dan-c-underwood.arm
code --install-extension danielberlin.centroid-gcode-language
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension gruntfuggly.todo-tree
code --install-extension gruntfuggly.todo-tree
code --install-extension ho-wan.setting-toggle
code --install-extension inu1255.easy-snippet
code --install-extension jeff-hykin.better-cpp-syntax
code --install-extension jmrog.vscode-nuget-package-manager
code --install-extension k--kato.docomment
code --install-extension leafvmaple.octave
code --install-extension marus25.cortex-debug
code --install-extension meowteam.vscode-math-to-image
code --install-extension meowteam.vscode-math-to-image
code --install-extension mikeburgh.xml-format
code --install-extension mousetraps.selected-character-count
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.csharp
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
code --install-extension ms-vscode.cmake-tools
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-vscode.js-debug-nightly
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vsonline.vsonline
code --install-extension natqe.reload
code --install-extension platformio.platformio-ide
code --install-extension ramyaraoa.show-offset
code --install-extension rogalmic.vscode-xml-complete
code --install-extension tht13.python
code --install-extension twxs.cmake
code --install-extension vsciot-vscode.vscode-arduino
code --install-extension webfreak.debug
code --install-extension yzane.markdown-pdf
```
