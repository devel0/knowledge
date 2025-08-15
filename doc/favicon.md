# favicon

## create favicon from svg

```sh
convert -density 300 -define icon:auto-resize=256,180,152,144,128,120,114,96,76,72,64,60,48,32,16 -background none app-icon.svg app-icon.ico
```

## manifest examples

```json
{
  "short_name": "testapp",
  "name": "Test app",
  "icons": [
    {
      "src": "app-icon.svg",
      "sizes": "48x48 72x72 96x96 128x128 256x256 512x512",
      "type": "image/svg+xml",
      "purpose": "any"
    },
    {
      "src": "app-icon.ico",
      "sizes": "16x16 32x32 48x48 57x57 60x60 64x64 72x72 76x76 96x96 114x114 120x120 128x128 144x144 152x152 180x180 256x256",
      "type": "image/x-icon",
      "purpose": "any"
    }
  ],
  "start_url": ".",
  "display": "standalone",
  "theme_color": "#000000",
  "background_color": "#ffffff"
}
```