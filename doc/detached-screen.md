# detached screen

- before to start a command you need to keep alive after logout issue

```sh
screen
```

press enter

- now start the command

- hit `ctrl+a` then `d`

- now screen detached, you can logout

- the process still running, enter again the ssh and issue `screen -r` to reattach that screen

- if want to keep detached again `ctrl+a` then `d`

- if have multiple screen use `screen -ls` to view status

