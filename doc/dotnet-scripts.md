# dotnet scripts

- Install the tool
```sh
dotnet tool install -g dotnet-script
```

## simple example

```sh
dotnet-script eval 'Console.WriteLine("Hello world!");'
```

## set a bash function

- Set an example function

```sh
function genJwt() { dotnet-script eval 'using System.Security.Cryptography; using System.Text; var rsaKey = RSA.Create(); var privateKey = rsaKey.ExportRSAPrivateKey(); System.Console.WriteLine(Convert.ToBase64String(privateKey));'; }
```

- Run the function

```sh
echo "$(genJwt)"
```