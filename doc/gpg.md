# gpg

## keys management

- generate key

```sh
gpg --gen-key 
```

- export public key

```sh
gpg --output public.gpg --armor --export EMAIL
```

- export private key

```sh
gpg --output private.gpg --armor --export-secret-key EMAIL
```

- import private key

```sh
gpg --import private.gpg
```

## encrypt/decript files

- encrypt FILE to FILE.gpg

```sh
gpg -e -r EMAIL FILE
```

- decrypt FILE.gpg to FILE

```sh
gpg -o FILE FILE.gpg
```
