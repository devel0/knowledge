# measure usb cable resistance

*[electronics](../README.md#electronics)*

## introduction

using multimeter ohm resistance can be read directly from the cable, but this require to access wires;
instead, having a constant current load ( eg. a led lamp of about 1A ie. 5W ), resistance of the cable can be measured indirectly using a [usb current meter](https://www.google.com/search?q=usb+current+meter&oq=usb+current+meter)
normally these devices comes with two side on for power input with a usb A cable male and microusb female and another side with output female A to attach the load.

```
                                       (usb meter)
                        male USB A---+--------------+
   POWER SOURCE                      | 5.13V 1.312A |---female USB A ---- to load
                   female microUSB---+--------------+

```

## steps to measure cable resistance

*suppose want to measure a male USB A to male micro USB cable resistance*

1. connect load on female USB A ( use eg. a lamp with constant load of about 1A )
2. connect usb meter to power source using its male USB A cable ( direct connection )
3. write down measured voltage and current ( eg. V1=5.13V I1=1.313A )
4. disconnect usb meter from power source
5. connect usb meter to power source using USBA-micro cable which resitance want to know
6. write down measure voltage and current ( eg. V2=4.90V I2=1.217A )
7. compute voltage drop
```
V = |V2 - V1| = |4.90 - 5.13| = 0.23V
```
8. compute current mean
```
I = |V1 + V2| / 2 = |1.217 + 1.313| / 2 = 1.265A
```
8. apply ohm law V=RI to find R
```
R = V / I = 0.23V / 1.265A = 0.181ohm
```

## notes

- from the example above can be seen that our load receive lower current 1.217A vs. 1.313A due to the presence of the cable. ( bad cables introduces high resistance reducing current available for the load )
- when connect a smartphone to charger using a cable and the phone reports that it can be recharged more fast with another cable you probably found a buggy cable ( bad manifacture due to tiny wires )
- resistance generally described as

R = r * L / A

where r ( resistivity ) depends on material, so resistance increase with length (L) and decrease with section area (A)
- resistivity of copper r = 1.72 x 10-8 Ωm
