# pcb etching

## requirements

- laser printer
- glossy paper 115g
- dry iron
- cooking paper
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
- print
  - File / Export PDF
    - TopLayer ( separate layer, check export ) to generate pcb
    - TopSilkLayer ( separate layer, check mirror ) to generate labels to attach non copper side
- toner transfer ( [video](https://youtu.be/TbBrgpKxBJk?list=LLSxwtecTaiSTtkh48QGLJtA&t=341) )
  - use a dry iron that has a flat surface
  - print with toner on photo glossy paper 115g
  - place a cooking paper over the glossy paper to allow iron sweep easily
  - proceed with iron for about 5 min over surface in X-Y-XY applying foreach pass a little pressure with body weight
  - wait surface become cold then gently remove paper
- etching using *Sodium persulfate* dissolved in water in proportion by product datasheet (usually 1/5 sodium/water); use  mechanical bubble shaker and an heat source to speed up process of copper removal ( a light bulb may enough ); tip: if you have solution in a plastic bottle you can put into hot water for 5min to increase temperature checking that internal bottle pressure not too much
