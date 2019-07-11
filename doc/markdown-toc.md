# markdown toc

*tools*

- [project page](https://github.com/jonschlinkert/markdown-toc)

## install

```sh
npm install -g markdown-toc
```

## usage

```sh
markdown-toc file.md
```

## paste file content and generate toc

follow create an empty file in `~/tmp/test.md` so you can paste markdown content here, then save and exit (ctrl+x), and results appear at console

```sh
truncate -s 0 ~/tmp/test.md && nano ~/tmp/test.md && markdown-toc ~/tmp/test.md
```
