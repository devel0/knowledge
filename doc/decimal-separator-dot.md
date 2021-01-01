# decimal separator dot

Gnome settings doesn't allow to customize decimal separator, you can choose for example Italy for hours, date and numeric separator all together; To force decimal separator with dot event with a locale that use a different one:

```sh
echo 'LC_NUMERIC="en_GB.UTF-8"' >> /etc/profile
```
