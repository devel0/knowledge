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
