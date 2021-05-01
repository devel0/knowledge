# pdf join into single page

## install

```sh
apt install texlive-extra-utils
```

## join

suppose want to generate a single page pdf with 4 PCB print (TOP.pdf, BOTTOM.pdf) in a layout like the follow

```
TOP BOTTOM
TOP BOTTOM
TOP BOTTOM
TOP BOTTOM
```

with some spacing vertically ( 50 from option `--delta hspace vspace` )

```sh
pdfjam --nup 2x4 --delta "0 50" --outfile output.pdf TOP.pdf BOTTOM.pdf TOP.pdf  BOTTOM.pdf TOP.pdf BOTTOM.pdf TOP.pdf BOTTOM.pdf
```

- reference: [pdfjam options](http://texdoc.net/texmf-dist/doc/latex/pdfpages/pdfpages.pdf)

- scaling: use `--scale 1.0` to avoid autoscale
