# opensource dev

This page collects some notes about how to start debugging to some opensource projects.

## avalonia

```sh
git clone https://github.com/AvaloniaUI/Avalonia.git
cd Avalonia
git submodule update --init

cd samples/ControlCatalog.NetCore
code .
```

- hit F5

## doxygen

```sh
git clone git@github.com:doxygen/doxygen.git
cd doxygen
apt install -y flex bison bibtex2html bibtexconv cmake build-essential
mkdir build
cd build
cmake ..
make -j 10
code .
```

- `C-S-p` -> CMake: Select a Kit -> GCC 12
- `C-S-p` -> CMake: Debug

to set project arguments edit `.vscode/settings.json`:

```json
{
    "cmake.debugConfig": {
        "args": [
            "/home/devel0/Documents/opensource/netcore-opengl/Doxyfile"
        ],
        "cwd": "/home/devel0/Documents/opensource/netcore-opengl"
        // "cwd": "${workspaceFolder}"
    }
}
```