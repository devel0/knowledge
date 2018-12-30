# atmega power save

*electronics*

## reason

- battery application
- main function can invoked
  - by press a button ( using external interrupt feature )
  - by autowakeup with sec interval given ( not supported in atmega8 due to lack of WDT interrupt )
  
## measured current using internal 8Mhz

| model | current in powerdown (mA) |
|---|---|
| ATmega8-16PU | < 0.001 |
| ATmega328P-PU | < 0.04 |
| ATmega8A-PU | < 0.5 |

**note** : ATmega8A-PU should given same of better power save so there is something more to set in the code to reach better values

## code

follow code show a led blink each 5 sec ( only atmega328 ) and allow to wakeup from deep sleep through button

```ino
#include <avr/sleep.h>
#include <avr/wdt.h>

#define INT_PIN 2
#define LED_PIN 3
#define ENABLE_WDT 0 // set to 0 for atmega8
#define AUTOWAKEUP_INTERVAL_SEC 5

#if defined (__AVR_ATmega8__)
  #if AUTOWAKEUP_INTERVAL_SEC>0
    #warning "atmega8 doesn't support watchdog interrupt mode; wakup still works through external interrupt"
  #endif
  #if ENABLE_WDT == 1
    #error "atmega8 doesn't support watchdog interrupt mode; please disable ENABLE_WDT"
  #endif
#endif

int wakeup_cnt=0;

#if ENABLE_WDT == 1

ISR(WDT_vect)
{      
  WDTCSR |= bit(WDIE);  
  ++wakeup_cnt;  
}

#endif

void blink()
{  
  Serial.println("blink");
  digitalWrite(LED_PIN, HIGH);
  delay(1000);
  digitalWrite(LED_PIN, LOW);
}

void setupWatchdog()
{
  #if ENABLE_WDT == 1
  WDTCSR = bit(WDE) | bit(WDCE);      
  WDTCSR = bit(WDP2) | bit(WDP1);
  WDTCSR |= bit(WDIE);
  #endif
}

void disableADC()
{
  ADCSRA &= ~(bit(ADEN));
}

void disableBOD()
{
  #if defined (__AVR_ATmega8__)
    // BOD disabled by fuse bit    
  #elif defined (__AVR_ATmega328__) || defined (__AVR_ATmega328P__)
    MCUCR |= bit(BODS) | bit(BODSE);
    MCUCR = MCUCR & ~(bit(BODSE) | bit(BODS));
  #endif
}

volatile int intTriggered = 0;

void intHandler()
{    
  intTriggered = 1;
}

void setup() {  
  Serial.begin(115200);
  
  // set all digital ports as OUTPUT except for the INT0 pin  
  for (int i = 0; i < 20; i++)
  {
    if (i != INT_PIN) pinMode(i, OUTPUT);
  }  
  disableADC();
  disableBOD();  

  #if ENABLE_WDT == 1
    setupWatchdog();
  #endif
}

void sleepNow()
{    
  if (wakeup_cnt == AUTOWAKEUP_INTERVAL_SEC || intTriggered)
  {    
    mainfn(); 
    wakeup_cnt=0;   
    intTriggered = 0;
  }
  
  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  sleep_enable();   
  attachInterrupt(digitalPinToInterrupt(INT_PIN), intHandler, LOW);  
  sleep_mode();  
  sleep_disable();
  detachInterrupt(digitalPinToInterrupt(INT_PIN));  
}

void mainfn()
{      
  blink();  
}

void loop() {     
  sleepNow();
}
```
