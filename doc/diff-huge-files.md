# diff-huge-files

## install

```sh
apt install -y git colordiff
chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
mkdir ~/scripts
cd ~/scripts
ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight
export PATH=$PATH:~/scripts >> ~/.bashrc
```

## execute

```sh
diff -u file1 file2 | colordiff | diff-highlight
```
