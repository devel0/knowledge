# grunt troubleshoot

## issue

running `grunt`

```
Running "jshint:gruntfile" (jshint) task
Warning: Path must be a string. Received null Use --force to continue.

Aborted due to warnings.
```

solve by

```
npm uninstall grunt-contrib-jshint --save-dev
npm install grunt-contrib-jshint --save-dev
```
