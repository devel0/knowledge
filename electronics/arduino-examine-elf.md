# arduino examine elf

*electronics*

## howto

During compilation an .elf file is produced and can be inspected further to identify heavy size symbols

```sh
readelf -a file.ino.elf
```

output can be filtered and sorted in this way

```sh
readelf -s file.ino.elf | sort -k 3 -n -r
```

## example output

sketch compile failed for an atmega328 ( 32k flash )

```
/home/devel0/.arduino15/packages/arduino/tools/avr-gcc/5.4.0-atmel3.6.1-arduino2/bin/avr-size -A /tmp/arduino_build_799383/temp-sensors.ino.elf

Sketch uses 33302 bytes (108%) of program storage space. Maximum is 30720 bytes.
Global variables use 1970 bytes of dynamic memory.
```

for a project that involves use of Ethernet enc28j60, SDCard, OneWire interface for DS18B20 temperature devices

```
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Atmel AVR 8-bit microcontroller
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          52 (bytes into file)
  Start of section headers:          275172 (bytes into file)
  Flags:                             0x5, avr:5
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         3
  Size of section headers:           40 (bytes)
  Number of section headers:         17
  Section header string table index: 14

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .data             PROGBITS        00800100 008112 000198 00  WA  0   0  1
  [ 2] .text             PROGBITS        00000000 000094 00807e 00  AX  0   0  2
  [ 3] .bss              NOBITS          00800298 0082aa 00061a 00  WA  0   0  1
  [ 4] .comment          PROGBITS        00000000 0082aa 000011 01  MS  0   0  1
  [ 5] .note.gnu.avr.dev NOTE            00000000 0082bc 000040 00      0   0  4
  [ 6] .debug_aranges    PROGBITS        00000000 008300 000318 00      0   0  8
  [ 7] .debug_info       PROGBITS        00000000 008618 018b0e 00      0   0  1
  [ 8] .debug_abbrev     PROGBITS        00000000 021126 004d33 00      0   0  1
  [ 9] .debug_line       PROGBITS        00000000 025e59 00797a 00      0   0  1
  [10] .debug_frame      PROGBITS        00000000 02d7d4 001788 00      0   0  4
  [11] .debug_str        PROGBITS        00000000 02ef5c 003d81 00      0   0  1
  [12] .debug_loc        PROGBITS        00000000 032cdd 00bf51 00      0   0  1
  [13] .debug_ranges     PROGBITS        00000000 03ec2e 000c30 00      0   0  1
  [14] .shstrtab         STRTAB          00000000 04322e 0000b4 00      0   0  1
  [15] .symtab           SYMTAB          00000000 03f860 001d60 10     16 180  4
  [16] .strtab           STRTAB          00000000 0415c0 001c6e 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  p (processor specific)

There are no section groups in this file.

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD           0x000094 0x00000000 0x00000000 0x0807e 0x0807e R E 0x2
  LOAD           0x008112 0x00800100 0x0000807e 0x00198 0x00198 RW  0x1
  LOAD           0x0082aa 0x00800298 0x00800298 0x00000 0x0061a RW  0x1

 Section to Segment mapping:
  Segment Sections...
   00     .text 
   01     .data 
   02     .bss 

There is no dynamic section in this file.

There are no relocations in this file.

The decoding of unwind sections for machine type Atmel AVR 8-bit microcontroller is not currently supported.

Symbol table '.symtab' contains 470 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 00800100     0 SECTION LOCAL  DEFAULT    1 
     2: 00000000     0 SECTION LOCAL  DEFAULT    2 
```

and sorting symbol table results most heavy functions/objects

```
   222: 00000154  3550 FUNC    GLOBAL HIDDEN     2 uip_process
   353: 0000689a  1904 FUNC    GLOBAL DEFAULT    2 main
   220: 0000375c  1556 FUNC    GLOBAL HIDDEN     2 loop
   273: 000055ba  1320 FUNC    GLOBAL HIDDEN     2 _ZN9DNSClient13getHostByN
   363: 00001a3a  1064 FUNC    GLOBAL HIDDEN     2 _ZN16UIPEthernetClass4tic
   462: 00007b42   962 FUNC    GLOBAL DEFAULT    2 vfprintf
   231: 00003fb6   912 FUNC    GLOBAL HIDDEN     2 _ZN7FatFile4openEPS_PKch.
   416: 00006536   868 FUNC    GLOBAL HIDDEN     2 _ZN16UIPEthernetClass5beg
   316: 00004f76   708 FUNC    GLOBAL HIDDEN     2 _ZN7FatFile5writeEPKvj.co
   206: 00001270   688 FUNC    GLOBAL HIDDEN     2 _ZN7FatFile2lsEP5Printhh.
   445: 0000200c   622 FUNC    GLOBAL HIDDEN     2 uipclient_appcall
   255: 00004346   602 FUNC    GLOBAL HIDDEN     2 _ZN9FatVolume4initEh.cons
   376: 0080055e   592 OBJECT  GLOBAL HIDDEN     3 SD
   137: 00003d70   582 FUNC    LOCAL  DEFAULT    2 _ZN7FatFile4openEPS_P7fna
   393: 00005b76   566 FUNC    GLOBAL HIDDEN     2 _ZN7FatFile4readEPvj
```
