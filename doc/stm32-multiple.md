# stm32 multiple devices

In order to upload and debug simultaneously to multiple stm32 devices add to platformio.ini replacing with your hla_serial and different debug_port ( 3334, 3335, ... ) foreach device.

Note: for dynamic variabile env name is used, replace with your specific

```ini
[env:nucleo_f446re]

# ...

#
# MULTIPLE STLINK UPLOAD & DEBUG
# -----------------------------------------------------------------
#
# to retrieve hla_serial connect a device at time then issue
#   lsusb -d 0483:374b -v | grep iSerial
# or
#   ls /dev/serial/by-id/usb-STMicroelectronics_STM32_STLink_*
#
# REPLACE with STLINK serial number and custom port ( different foreach device )
#
custom_hla_serial = "xxxxxxxxxxxxxxxxxxxxxxxx"
custom_debug_port = 3334

#

debug_port = localhost:${env:nucleo_f446re.custom_debug_port}
debug_server = $PLATFORMIO_CORE_DIR/packages/tool-openocd/bin/openocd
  -s
  /home/devel0/.platformio/packages/tool-openocd  
  -c
  gdb_port ${env:nucleo_f446re.custom_debug_port}; tcl_port disabled; telnet_port disabled
  -s /home/devel0/.platformio/packages/tool-openocd/scripts
  -f
  board/st_nucleo_f4.cfg
  -c
  hla_serial ${env:nucleo_f446re.custom_hla_serial}

upload_protocol = custom
upload_command = openocd -d2 -s $PLATFORMIO_CORE_DIR/packages/tool-openocd/scripts -f board/st_nucleo_f4.cfg -c "hla_serial ${env:nucleo_f446re.custom_hla_serial}" -c "program {.pio/build/nucleo_f446re/firmware.elf}  verify reset; shutdown;"
```