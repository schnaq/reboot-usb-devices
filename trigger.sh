#!/bin/bash

echo "$(date): Nikon disconnected" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log

FILE=/opt/reboot-usb-devices/reboot.lock

cat $FILE >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log

if [ ! -f "$FILE" ]
then
  echo "$(date): Restarting USB Hub" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log
  echo 1 >> $FILE
  /sbin/uhubctl -a cycle -l 2 & # >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log
  rm $FILE
else
  echo "$(date): Skipping" >> /opt/reboot-usb-devices/logs/reboot-usb-devices.log
fi
