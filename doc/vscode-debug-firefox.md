# vscode debug firefox

<!-- TOC -->
- [vscode debug firefox](#vscode-debug-firefox)
  * [pre](#pre)
  * [install a webserver to serve your index.htm](#install-a-webserver-to-serve-your-indexhtm)
  * [run local webserver](#run-local-webserver)
  * [run firefox in debug mode](#run-firefox-in-debug-mode)
  * [from vscode](#from-vscode)
  * [test](#test)
<!-- TOCEND -->

<hr/>

## pre

go to `about:config` and set followings

```
devtools.debugger.remote-enabled : true
devtools.chrome.enabled : true
devtools.debugger.workers : true
devtools.debugger.prompt-connection : false
```

if want to debug non localhost add following

```
devtools.debugger.force-local : false
```

## install a webserver to serve your index.htm

```
npm install -g local-web-server
```

## run local webserver

```
ws -p 80 --spa index.html
```

## run firefox in debug mode

```
firefox --start-debugger-server http://localhost
```

## from vscode

add prerequisite addon `Debugger for Firefox`

from debug choose `Launch localhost`

## test

set some breakpoint in your js
