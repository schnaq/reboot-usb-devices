#!/bin/bash

echo "$(date): Checking for Nikon Cameras" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log

gphoto2 --auto-detect | grep Nikon
if [ $? -eq 0 ]
then
  echo "$(date): Nikon found" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log
else
  echo "$(date): Nikon not found" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log
fi
