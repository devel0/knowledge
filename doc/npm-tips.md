# npm tips

*[webdevel](../README.md#webdevel)*

## upgrade all packages

```sh
sudo npm install -g npm-check-updates
ncu -u
npm install
```

## use local npm packages

```sh
 npm config set prefix '~/.npm-global'
 echo 'export PATH=$PATH:~/.npm-global/bin' >> ~/.bashrc
 source ~/.bashrc
```

## install latest npm version

- [link](https://websiteforstudents.com/install-the-latest-node-js-and-nmp-packages-on-ubuntu-16-04-18-04-lts/)

## clear npm cache

```sh
clean npm cache npm cache clean -f
```

## link a local package source

```sh
cd ./my-project
npm link path-to-local-module
```

## install package from github repo commit id

```sh
npm install https://github.com/user/project/tarball/commitid --save-dev
```
