# linux vscode cpp dev

*development*

## prerequisites

- install [vscode](https://code.visualstudio.com/)
- install gcc and gdb
- install vscode extension [esy c++ project](https://github.com/acharluk/easy-cpp-projects)

## troubleshoot

- using vscode 1.30 gives an [error](https://github.com/Microsoft/vscode/issues/64948) when starting debug `Stopping due to fatal error: NullReferenceException: Object reference not set to an instance of an object`
  - solve by setting "externalConsole" to false in `.vscode/launch.json`

