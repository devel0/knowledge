# markdown toc

- [project page](https://github.com/jonschlinkert/markdown-toc)
- see also: [markdown-toc2](https://github.com/devel0/linux-scripts-utils/blob/11b77b6b9d58e3ce8cabd7e37b17685ec6c0bb6a/markdown-toc2)

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
