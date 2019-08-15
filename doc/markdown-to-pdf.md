# markdown to pdf

*[tools](../README.md#tools)*

## install

```
apt install -y rubygems-integration ruby-dev zlib1g-dev
gem install gimli
```

## usage

follow create file.pdf from given file.md markdown input

```
gimli -f file.md
```

or to merge multiple markdown files

```
gimli -f . -merge -outputfilename bookfile -wkhtmltopdfparameters "-t"
```
