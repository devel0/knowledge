# gnuplot

<!-- TOC -->
- [gnuplot](#gnuplot)
  * [command line execution](#command-line-execution)
  * [multiplot from files](#multiplot-from-files)
  * [styling](#styling)
  * [references](#references)
<!-- TOCEND -->

## command line execution

From a set of data like following

```
sec V_0 mA_0 W_0 mAh_0 V_1 mA_1 W_1 mAh_1 
5 3.69 36.87 0.14 0.05 4.12 41.19 0.17 0.06 
10 3.69 36.91 0.14 0.10 4.12 41.24 0.17 0.11 
15 3.69 36.91 0.14 0.15 4.12 41.24 0.17 0.17 
```

use command line gnuplot to create two window that plots column V(1), V(2) and mAh(1), mAh(2)

```
echo "press enter to close"

gnuplot -e \
'set terminal wxt; plot "out.txt" using 1:2 title "V(1)" with lines, "" using 1:6 title "V(2)" with lines; '\
'set terminal wxt 1; plot "out.txt" using 1:5 title "mAh(1)" with lines, "" using 1:9 title "mAh(2)" with lines;'\
'pause -1;'
```

![img](/_files/gnuplot-sample.png)

## multiplot from files

suppose out.txt and out2.txt with contents TIME SPEED and TIME ACCEL respectively:

```
gnuplot -e \
'set grid xtics ytics; set grid;'\
'set xlabel "time(us)";'\
'plot "out.txt" title "speed(rps)",'\
'"out2.txt" title "accel(rps2)";'\
'pause -1;'
```

## styling

- plot with lines

```
plot "out.txt" with lines
```


- plot with lines and points

```
plot "out.txt" with linespoint
```

## references

- [plotting data with gnuplot](https://www.cs.hmc.edu/%7Evrable/gnuplot/using-gnuplot.html)
