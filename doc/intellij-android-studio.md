# intellij android studio

## install

```
apt install openjdk-8-jre openjdk-8-jdk
snap install android-studio
```

## connect phone usb

- enable developer mode on the phone / debug usb

## troubleshoot preview xml not shown

if using dark theme fix the app file `res/values/styles.xml` changing

```xml
<style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
```

to

```xml
<style name="AppTheme" parent="Base.Theme.AppCompat.Light.DarkActionBar">
```
