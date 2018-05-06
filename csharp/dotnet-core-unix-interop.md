# dotnet core unix interop

*csharp*

## preamble

- dep on native platform broke interoperability
- use of mono.posix nuget package
- but could possible to wrap c++ .so library using DllImport

## using mono.posix

- install nuget package

```
dotnet add package Mono.Posix.NETStandard --version 1.0.0
```

- [reference docs](http://docs.go-mono.com/?link=M%3aMono.Unix.Native.Syscall.stat)

- example

```csharp
Mono.Unix.Native.Stat buf;
Mono.Unix.Native.Syscall.stat("/etc/hosts", out buf);
```

## using DllImport and C++

- create the LinuxHelper folder with wrapper Helper.cpp

```cplusplus
#include <stdio.h>
#include <stdlib.h>

extern "C" {
int sum(int a, int b)
{
    return a + b;
}
}
```

- and Makefile

```Makefile
CC=g++
CFLAGS=-c -Wall
LDFLAGS=-shared
SOURCES=Helper.cpp
OBJECTS=$(SOURCES:.cpp=.o)
LIBRARY=Helper.so

all: $(SOURCES) $(LIBRARY)

$(LIBRARY): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o *.so
```

- adjust tasks.json to build .so library before to run net core app

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "command": "dotnet",
            "type": "process",
            "args": [
                "build",
                "${workspaceFolder}/Test/Test.csproj"
            ],
            "problemMatcher": "$msCompile",
            "dependsOn": [
                "buildhelper"
            ]        
        },
        {
            "label": "buildhelper",            
            "command": "make",
            "args": [],
            "options": {
                "cwd": "${workspaceFolder}/LinuxHelper"
            },
            "problemMatcher": [
                "$gcc"
            ]
        }
    ]
}
```
