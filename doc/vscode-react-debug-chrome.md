# vscode react debug chrome

## start vscode

```sh
code .
```

## configure debug launch ( once )

- C-S-P then write `Debug: Add Configuration...`
- choose `Web App (Chrome)` 

## tune configuration

```json
{    
    "version": "0.2.0",
    "configurations": [
        {
            "type": "chrome",
            "request": "launch",
            "name": "Launch Chrome against localhost",
            "url": "http://localhost:3000",
            "runtimeArgs": ["--ignore-certificate-errors", "--test-type"],
            "webRoot": "${workspaceFolder}"
        }
    ]
}
```

| tuned | description |
|---|---|
| `"url": "http://localhost:3000",` | URL of startup browsing page |
| `"runtimeArgs": ["--ignore-certificate-errors", "--test-type"],` | (OPTIONAL for localhost debug) : disable ssl cert check |

## start react

```sh
yarn start
```

## start react debug

hit F5