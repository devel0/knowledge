# prompt colors

- copy [themeprompt](https://raw.githubusercontent.com/devel0/linux-scripts-utils/master/themeprompt) script into `~/.themeprompt`
- read script with `source ~/.themeprompt`
- function syntax

```
themeprompt [prod|prod-user|dev|dev-user|test|test-user]
```

or custom

```
themeprompt [fg] [bg]
```

- examples

| cmd                     | sample                                      |
| ----------------------- | ------------------------------------------- |
| `themeprompt prod`      | ![](../_files/themeprompt-prod.png)         |
| `themeprompt prod-user` | ![](../_files/themeprompt-prod-user.png)    |
| `themeprompt dev`       | ![](../_files/themeprompt-dev.png)          |
| `themeprompt dev-user`  | ![](../_files/themeprompt-dev-user.png)     |
| `themeprompt test`      | ![](../_files/themeprompt-test.png)         |
| `themeprompt test-user` | ![](../_files/themeprompt-test-user.png)    |
| `themeprompt 15 53`     | ![](../_files/themeprompt-custom-fg-bg.png) |
| `themeprompt 53`        | ![](../_files/themeprompt-custom-fg.png)    |

- example usage in `~/.bashrc`

```sh
source ~/.themeprompt
themeprompt prod
```

- full color table follows

![](../_files/xterm-256color.svg)

