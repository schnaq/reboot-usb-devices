#!/bin/bash

echo "Camera disconnected at $(date)" >> /home/pi/reboot-usb-devices/logs/reboot-usb-devices.log

# -p: port numbers
# -l: hub number
# -a: action
sudo uhubctl -a cycle -p 1-4 -l 2
