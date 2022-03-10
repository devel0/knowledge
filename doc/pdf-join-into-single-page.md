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

### util

this utility [nup-pdf-into-single-page](https://github.com/devel0/linux-scripts-utils/blob/2d1ae112c659d1f9597b2697c07668bb0bb7e914/nup-pdf-into-single-page) allow to multiply the same pdf into a single page calculating final page size allowing correct scaling.

example:
- top.pdf
- bottom.pdf

two files have 184.46pt x 127.8pt size [ W x H ] ( use pdfinfo to retrieve these values )

first step is to obtain a single file that will be multiplied into a single page over a specified cols, rows grid:

```sh
pdfjam --papersize '{388.92pt,127.8pt}' --delta "20 0" --nup '2x1' --outfile top-bottom.pdf top.pdf bottom.pdf  && pdfinfo top-bottom.pdf 
```

this produce top-bottom.pdf from top.pdf and bottom.pdf where 388.92pt = 184.46 + 20 + 184.46

now can create out.pdf with follow

```sh
nup-pdf-into-single-page 1.0 1 5 5 ./top-bottom.pdf 
```

to produce a single page with 5 rows each one filled with top-bottom.pdf
