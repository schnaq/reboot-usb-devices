#!/bin/bash

echo "$(date): Camera disconnected" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log

# -p: port numbers
# -l: hub number
# -a: action
sudo uhubctl -a cycle -l 2
