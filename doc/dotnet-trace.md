# dotnet-trace

## global tools

- [overview](https://learn.microsoft.com/en-us/dotnet/core/diagnostics/tools-overview)
- [dotnet-gcdump](https://learn.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-gcdump)

```sh
dotnet tool install --global dotnet-gcdump
```

view `gcdump` file

```sh
dotnet tool install -g dotnet-heapview
```


## install

```sh
dotnet tool install --global dotnet-trace
```

## capture a process

replace PID with the process pid to trace

```sh
dotnet-trace collect -p PID --format Chromium
```

open generated json file through browser going to location (CTRL+L) `edge://tracing` or `chrome://tracing`

## trouble `No usable version of libssl was found`

```sh
mkdir ~/net5.ssl
cd ~/net5.ssl
wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
tar xvf openssl-1.1.1c.tar.gz
cd openssl-1.1.1c
./config && make -j 10
```

then use an alias to run dotnet-trace

```sh
echo 'alias dotent-trace="LD_LIBRARY_PATH=$HOME/net5.ssl dotnet-trace"' >> ~/.bashrc
```
