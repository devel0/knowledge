# uno

## install

```sh
dotnet new install Uno.Templates
```

## prerequisites

- for android workload install `android studio` before `uno-check` then install emulator and sdk 34 also
  - tools/device manager ( download the emulator )
  - tool/sdk tools ( `Android SDK Command-line Tools (latest)` )
- setup `ANDROID_HOME` in environment `~/.bashrc` and path to cmdline tools
  
```sh
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
```

```sh
apt install openjdk-21-jdk openjdk-11-sdk
dotnet tool install -g uno.check
uno-check
```

## quickstart

```sh
dotnet new uno -n testuno
cd testuno
sudo dotnet workload restore
dotnet run --framework=net8.0-desktop
```

# development

- install `uno platform` vscode extension
- reload vscode
- open `MainPage.xaml` and issue `C-S-p: Uno Platform: Open Settings` then login/register to uno platform to enable hotreload
- note: to enable debug breakpoint start with `Ctrl+F5` instead of `F5` the debugger will attach itself to the process
- use the bottom bar to change Target between android, desktop, browserwasm
