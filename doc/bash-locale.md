# bash locale

## using invariant numeric

```sh
LC_NUMERIC="en_US.UTF-8"
printf "%0.2f" 10.2
```

output is `10.20`

## using specific numeric

```sh
LC_NUMERIC="it_IT.UTF-8"
printf "%0.2f" 10.2
```

output is `bash: printf: 10.2: invalid number`

because bash interpret number within numeric locale, so

```sh
LC_NUMERIC="it_IT.UTF-8"
printf "%0.2f" 10,2
```

output is `10,20`