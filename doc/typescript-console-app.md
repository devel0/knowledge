# typescript console app

```sh
npx simple-ts-app my-app
cd my-app
npm run dev
```

## vscode debug prerequisite

- create launch.json with Run and Debug -> create a launch.json file ( Node.js )

- add ts to js tool

```sh
npm i -D ts-node
```

- then edit `.vscode/launch.json` adding in the "configurations" item section

```json
"runtimeArgs": [
    "-r",
    "ts-node/register"
],
"args": [
    "${workspaceFolder}/src/index.ts"
]
```

now F5 should run the app and hit breakpoints
