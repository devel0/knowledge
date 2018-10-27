# find and exec

*shell*

## search file pattern and exec cmds to each one

```
find . -type f -name "20*.jpg" -exec echo "cmd1 on [{}]" \; -exec echo "cmd2 on [{}]" \;
```

notes:
- `{}` will replaced with filename
- `\;` execute command one file by one
- `\+` execute command replacing {} with all matched files ( argument list could result too long )

## compute total size of find files

```
find . -type f -name "20*.jpg" -exec du -ch \+
```
