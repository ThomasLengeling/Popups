# Baudrate
###### A python script to find baudrate of a device's serial interface.

This script was originally developed and hosted at - [Google Code](https://code.google.com/archive/p/baudrate/) and [devttys0](http://www.devttys0.com/2012/11/reverse-engineering-serial-ports/)

### Description:
###### (as provided originally)
```
Identify the baud rate of an unknown serial device

Baudrate is a tool to help quickly identify the baud rate of an unknown serial device. It displays received data from a serial device while allowing the user to change the baud rate of their host system's serial port on the fly.

Baudrate will optionally create a minicom-compatible configuration file once the correct baud rate of the serial device has been identified.

This is particularly useful when attaching to unknown serial devices, such as those on embedded boards.
```   
## Usage:
`$sudo ./baudrate.py -p /dev/ttyUSB0`

#### Reference:
http://www.devttys0.com/2012/11/reverse-engineering-serial-ports/
