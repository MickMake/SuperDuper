
![MickMake](https://www.mickmake.com/banner.png)


# Super Duper boards
This repo contains everything related to my Super Duper boards.


## What are they?
Super Dupers are a series of portable, low power, credit card sized boards aimed at SD storage. Four buttons and a flexible display interface supporting OLED, e-ink and LCD allows them to be truly portable.
Currently the Super Duper Logger is the only one in existance. Once I bring it out of alpha status, I'll post more detail on this board.

The Super Duper line-up:
- Super Duper Logger - A flexible SD logger that will log data from USB, WiFi or LoRa to one or both SD cards, (for redundancy or fail-over).
- Super Duper Copier - (In design stage) A board that will copy data to/from an SD card from/to a virtual image on SD, USB, WiFi or LoRa.
- Super Duper Virtual - (TBD) Provides virtual SD card support allowing you to store an SD image on an SD card, (or virtual via USB and PC), and present this to a camera, SBC, or any other device with an SD slot.

## Super Duper Logger
![MickMake](https://github.com/MickMake/SuperDuper/raw/master/SuperDuperLogger2.jpg)


## Current status
- Super Duper Logger - Alpha state. Full Arduino IDE support, but limited API.
- Super Duper Copier - Currently in PCB design stage. Working protoype expected soon.
- Super Duper Virtual - TBD.


## Directories
`ArduinoIDE/` - Full Super Duper board support for the Arduino IDE. Currently implements basic GPIOs, SPI ports, LEDs, but no limited API.

