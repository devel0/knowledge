# sync back fork to origina;

## scenario

- forked a project
- original project have some commit ahead your fork
- want to integrate original project changes into your fork

## howto

- replace `original-repo-url`

```sh
git remote add original original-repo-url
git fetch original master
git merge original/master
git push
```
