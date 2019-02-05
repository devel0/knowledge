# chrome

*webdevel*

## useful shortcuts

- `CTRL numpad+` zoom in dev window
- `CTRL numpad+` zoom out dev window

## disable cors

- to be used only temporarly in case of need for development ( for example if need to access webapi different from the source page )

```
mkdir -p ~/tmp/chrome-cors ; google-chrome --disable-web-security --user-data-dir=~/tmp/chrome-cors --allow-file-access-from-files
```

## remote debug through usb

useful to access console, breakpoint etc for chrome running on an android

- enable android **developer mode** from settings / About Phone / Software Information / Build number ( tap build number until dev mode on )
  - go back to Settings and enable **USB debugging** in Developer options
- start chrome from pc, **F12**, Menu->More tools->Remote Devices
  - choose phone / confirm access from the phone and open android window on pc through "Inspect" button
