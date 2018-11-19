# esp8266 twi arduino nano

*electronics*

- twi line locked down and never pullup again when slave too slow in respond
- solve by increase setting clock strech limit

```c
Wire.begin(D2, D1);
Wire.setClockStretchLimit(1000);
```

## references

- [post](https://forum.arduino.cc/index.php?topic=336543.msg2746895#msg2746895)
