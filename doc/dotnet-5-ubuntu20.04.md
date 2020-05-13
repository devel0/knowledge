# dotnet 5 on ubuntu 20.04

until it will supported through deb to make it work snap install could used, but I needed to have 3.1 and 5.0 sdks without to switch beetween, so follow is my approach:

- download
  - [netcore3.1 sdks binaries](https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.202-linux-x64-binaries)
  - [netcore5.0 sdks binaries (preview)](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-5.0.100-preview.3-linux-x64-binaries)
  - [libicu63 for netcore5.0 preview](https://mirrors.edge.kernel.org/ubuntu/pool/main/i/icu/libicu63_63.2-2_amd64.deb)
- create an `/opt/netcore` and unpack there netcore-3.1 then netcore-5.0
- install libicu63 `sudo dpkg -i libicu63_63.2-2_amd64.deb`
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

- sdks available

```sh
devel0@tuf:~$ dotnet --list-sdks
3.1.202 [/opt/dotnet/sdk]
5.0.100-preview.3.20216.6 [/opt/dotnet/sdk]
```

- to enable vscode omnisharp to work correctly I needed to apply follow `omnisharp.json` file in the solution or alternatively globally placing into `~/.omnisharp/omnisharp.json`

```json
{
    "MsBuild": {
        "UseLegacySdkResolver": true
    }
}
```

- optional: in the solution folder initialize global json and change in case ( see `dotnet --list-sdks` for specific names )

```sh
dotnet new globaljson
```

test it opening previous `test` solution then set a breakpoint and hit F5
