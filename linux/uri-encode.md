# uri encode

*linux*

```sh
echo "sample <b>bold</b>" | node -p 'encodeURIComponent(require("fs").readFileSync(0))'
```

results

```
sample%20%3Cb%3Ebold%3C%2Fb%3E%0A
```

## references

- [stackoverflow](https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command)
