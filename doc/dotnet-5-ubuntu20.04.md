# dotnet 5 on ubuntu 20.04

until it will supported through deb to make it work snap install could used, but I needed to have 3.1 and 5.0 sdks without to switch beetween, so follow is my approach:

- download
  - [netcore3.1 sdks binaries](https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.202-linux-x64-binaries)
  - [netcore5.0 sdks binaries (preview)](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-5.0.100-preview.3-linux-x64-binaries)
- create an `/opt/netcore` and unpack there netcore-3.1 then netcore-5.0
- setup `~/.bashrc` so that

```sh
export DOTNET_ROOT=/opt/dotnet
export PATH=$PATH:$DOTNET_ROOT
```

- test with

```sh
dotnet new console -n test
cd test
dotnet build
dotnet run
```

- to enable vscode omnisharp to work correctly I needed to apply follow `omnisharp.json` file in the solution

```json
{
    "MsBuild": {
        "UseLegacySdkResolver": true
    }
}
```
