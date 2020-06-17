# pdf join into single page

## install

```sh
apt install texlive-extra-utils
```

## join

suppose want to generate a single A4 with 4 PCB (TOP.pdf, BOTTOM.pdf) into single file in a layout like the follow

```
TOP BOTTOM
TOP BOTTOM
TOP BOTTOM
TOP BOTTOM
```

```sh
pdfjam --nup 2x4 --delta "0 50" --outfile output.pdf TOP.pdf BOTTOM.pdf TOP.pdf  BOTTOM.pdf TOP.pdf BOTTOM.pdf TOP.pdf BOTTOM.pdf
```

- reference: [pdfjam options](http://texdoc.net/texmf-dist/doc/latex/pdfpages/pdfpages.pdf)
