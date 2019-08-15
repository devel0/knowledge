# pcb etching

*[electronics](../README.md#electronics)*

## requirements

- laser printer
- coated photo paper
- acetone ( nails polish remover ), spray dispenser, gas protection mask, mini compressor roller rubberized
- sodium persulfate, etching tank, mini air compressor to generate bubbles, a lamp to transfer some heat to increase speed

## procedure

- draw pcb ( [easyeda](https://easyeda.com) )
  - schematics
    - use left toolbar symbols for most commons ( resistor, capacitor, ... )
    - insert well known components through libraries ( double check for either schematics and pcb available )
    - useful parts:
      - pin headers (system)
      - atmega328 (user contributed : cpu76239 )
    - connect ground to each gnd and vcc
  - pcb
    - generate from schematics through Convert / Convert to PCB ( or update if existing )
    - install local easyeda autoroute to use autoroute faster
    - check [track width](https://www.7pcb.com/trace-width-calculator.php) based on copper thickness and current
    - Tools / Design Rules ( set track width default )
    - Route / Auto Route
      - Route Layers ( deselect BottomLayer if want single-side ). It may unable to resolve but you can Stop and complete by hand unresolved RatLines
  - etching using *Sodium persulfate* dissolved in water in proportion by product datasheet ; use  mechanical bubble shaker and an heat source to speed up process of copper removal ( a light bulb may enough )
- print
  - File / Export PDF
    - TopLayer ( separate layer, check export ) to generate pcb
    - TopSilkLayer ( separate layer, check mirror ) to generate labels to attach non copper side
- toner transfer ( [video](https://www.youtube.com/watch?v=FFKI34tewps&t=125s) )
  - clean the copper with fine wool
  - clean the copper with alchool
  - from print cut border of coated photo paper to same size of copper to ease placing
  - maintain in position and spray onto it using acetone ( use a mask to protect respiratory tract )
  - wait 15 sec
  - apply toiler paper onto coated photo paper
  - pass compressor roller making a light and equal pressure to transfer the toner ( if you press too hard the toner spreads ) ; a roller can be built from a cylyndrical pencil with two heat shrink applied around
  - put into water just 2 second and extract placing onto a toiler paper
  - place another toilet paper onto the pcb with photo paper still applied to absorbe water with a light global pressure
  - remove photo paper
  - remove eventual residual using fingers putting it under running water
