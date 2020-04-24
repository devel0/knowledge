# schematics and pcb editor

## website

[easyeda.com](https://easyeda.com/)

## tips

- create library component
  - click Library
  - SCH Libs is where schematics block resides
  - PCB Libs is where related pcb blocks are
  - when editing a SCH component you can specify related package clicking on Custom Attributes / Package and with Search filter to choose requested pcb block
  - if you change PCB block of an existing SCH component you need to reselect from custom attributes to update it, then from the schematics of the project right click on component / update to update its block assignment

- track widths ( https://www.7pcb.com/trace-width-calculator.php )

- local routing : just download the client and run the script to execute router locally that improve speed of autorouter
  - workaround : place at least one text in TopLayer
- PCB
  - create board outline ( Tools / Set Board outline )
  - semiautomatic routing to place via only outside pins
    - lock board outline
    - on Layers and Objects panel select only Track and Via then CTRL+A and canc to remove every routed tracks and vias
    - on Preview / AutoRouter / Skip Nets insert GND and other secondary nets to avoid conflicting in routing only 1 layer bottom
    - on Preview / AutoRouter / Router Layers choose only Bottom Layer and route
    - if router solve go back to Track and Via deletion and repeat the process removing some nets from Skip Nets, hopefully you can insert all nets in a side, but realistic may you need another layer
    - when bottom layer is full and cannot take place for other nets do not run autorouter again and solve toplayer manually inserting last leg to the pin as bottom layer track so that automatically via will created to join tracks
