# self signed cert

- [scripts](#scripts)
- [create root CA](#create-root-ca)
- [install root CA](#install-root-ca)
  - [system wide (apps)](#system-wide-apps)
  - [system wide (firefox)](#system-wide-firefox)
  - [user (chrome)](#user-chrome)
- [create multisubject certificate](#create-multisubject-certificate)
- [localhost development certificate](#localhost-development-certificate)
  - [asp net](#asp-net)
  - [vite.config.ts](#viteconfigts)
- [config nginx](#config-nginx)

## scripts

- [create-root-ca.sh](../_files/create-root-ca.sh)
- [create-cert.sh](../_files/create-cert.sh)

## create root CA

- create `cert-parameters` changing as needed

```sh
#!/usr/bin/env bash

COUNTRY="IT"
STATE="Italy"
CITY="Trento"
ORGNAME="SearchAThing"
ORGUNIT="Development"
DOMAIN=searchathing.com
DURATION_DAYS=36500 # 100 years
```

- run `create-root-ca.sh`
- this generates
  - `~/sscerts/DOMAIN_CA.crt`
  - `~/sscerts/DOMAIN_CA.key`

notes:
- keep `~/sscerts/DOMAIN_CA.key` securely; this file IS NOT NEEDED for nginx
- `~/sscerts/DOMAIN_CA.crt` is the root ca certificate that can be "shared" across devices ( see [install root CA](#install-root-ca) ) to trust websites served from nginx using self signed certificates ( see [create multisubject certificate](#create-multisubject-certificate) )

## install root CA

- copy "...._CA.crt" to `/usr/local/share/ca-certificates`

### system wide (apps)

To allow curl, etc to trust your self signed cert:

- run `update-ca-certificates`

### system wide (firefox)

- create `/usr/lib/firefox/distribution/policies.json` changing:
  - `searchathing.com_CA.crt` with your root ca cert file

```json
{
    "policies": {
        "Certificates": {
            "ImportEnterpriseRoots": true,
            "Install": [
                "/usr/local/share/ca-certificates/searchathing.com_CA.crt"
            ]
        }
    }
}
```

### user (chrome)

- import root ca in chrome
    - settings
    - privacy and security
    - security
    - Manage certificates
    - Authorities
    - import
    - choose _CA.crt file

## create multisubject certificate

- file `root-ca-parameters` from previous step is needed
- run `create-cert.sh NAME1 NAME2 ...` to create a self signed cert with subject alternative names NAME1.DOMAIN, NAME2.DOMAIN  
- this generates follow files in `sscerts/NAME1.DOMAIN`
  - `NAME1.DOMAIN.key` ( certificate private key to be used in nginx `ssl_certificate_key` parameter )
  - `NAME1.DOMAIN.crt` ( certificate to be used in nginx `ssl_certificate` parameter )
  - `NAME1.DOMAIN.crt.conf` ( certificate config )
  - `NAME1.DOMAIN.csr` ( certificate signing request )
  - `NAME1.DOMAIN.csr.conf` ( certificate signing request config )

## localhost development certificate

- create `cert-parameters` for localhost dev

```sh
#!/usr/bin/env bash

COUNTRY="IT"
STATE="Italy"
CITY="Trento"
ORGNAME="SearchAThing"
ORGUNIT="Development"
DOMAIN=localhost
DURATION_DAYS=36500 # 100 years
```

and issue

`create-cert --add-empty`

- trust w/browser and/or system ca-certificates
  - root ca will be `~/sscerts/localhost_CA.crt`
- use in aspnet and/or vite
  - cert crt will be `~/sscerts/localhost/localhost.crt`
  - cert key will be `~/sscerts/localhost/localhost.key`

### asp net


```csharp
public static partial class Toolkit
{

    public static string DevelopmentCertificateCrtPathfilename
    {
        get
        {
            return Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.UserProfile),
                "sscerts",
                "localhost",
                "localhost.crt");
        }
    }

    public static string DevelopmentCertificateKeyPathfilename
    {
        get
        {
            return Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.UserProfile),
                "sscerts",
                "localhost",
                "localhost.key");
        }
    }

}

public static partial class Ext
{

    /// <summary>
    /// configure kestrel to use development certificates ~/sscerts/localhost
    /// </summary>
    public static void ConfigureDevCerts(this WebApplicationBuilder builder)
    {
        if (builder.Environment.IsDevelopment())
        {

            builder.WebHost.ConfigureKestrel((context, serverOptions) =>
            {
                var kestrelSection = context.Configuration.GetSection("Kestrel");

                serverOptions.ConfigureHttpsDefaults(configureOptions =>
                {
                    configureOptions.ServerCertificateSelector = (connectionContext, name) =>
                    {
                        var crt = X509Certificate2.CreateFromPemFile(
                            DevelopmentCertificateCrtPathfilename,
                            DevelopmentCertificateKeyPathfilename);

                        return crt;
                    };
                });
            });

        }
    }

}
```

then from `Program.cs`


```csharp
var builder = WebApplication.CreateBuilder(args);

builder.ConfigureDevCerts();
```

### vite.config.ts

```ts
import * as path from "path";
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import fs from 'fs';
import * as os from 'os'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    https: {
      key: fs.readFileSync(path.join(os.homedir(), 'sscerts', 'localhost', 'localhost.key')),
      cert: fs.readFileSync(path.join(os.homedir(), 'sscerts', 'localhost', 'localhost.crt'))
    },
    port: 5012,
    strictPort: true,
    proxy: {
      '/api': {
        target: 'https://localhost:5011/',
        changeOrigin: true,
        secure: true
      }
    }
  }  
})
```

## config nginx

- create `/etc/nginx/conf.d/cathouse.conf` changing
  - `cathouse.searchathing.com`
  - `10.10.4.106` with http server to proxy from https
  - `/root/sscerts/dev.searchathing.com/dev.searchathing.com.crt` with path of cert generated through `create-cert.sh`
  - `/root/sscerts/dev.searchathing.com/dev.searchathing.com.key` with path of cert key generated through `create-cert.sh`

```conf
server {
    root /var/www/html;

    server_name cathouse.searchathing.com;

    location / {
        # uncomment below to allow access only from intranet specific ip addresses
        # allow 10.10.4.200/32; # tuf
        # allow 10.10.4.201/32; # tuf wifi
        # deny all;

        proxy_set_header Host $host;
        proxy_pass http://10.10.4.106;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    listen 443 ssl;
    ssl_certificate /root/sscerts/dev.searchathing.com/dev.searchathing.com.crt;
    ssl_certificate_key /root/sscerts/dev.searchathing.com/dev.searchathing.com.key;
}

server {
    if ($host = cathouse.searchathing.com) {
        return 301 https://$host$request_uri;
    }

    server_name cathouse.searchathing.com;
    listen 80;
    return 404;
}
```
