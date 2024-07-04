#!/bin/bash

BASE=/opt/reboot-usb-devices
FILE=$BASE/reboot.lock

if [ ! -f "$FILE" ]
then
  echo "$(date): Restarting USB Hub" >> $BASE/logs/reboot-usb-devices.log
  echo 1 >> $FILE
  sudo /sbin/uhubctl -a cycle # >> $BASE/logs/reboot-usb-devices.log
  # /sbin/uhubctl -a cycle -l 1 # >> $BASE/logs/reboot-usb-devices.log
  rm $FILE
else
  echo "$(date): Skipping" >> $BASE/logs/reboot-usb-devices.log
fi
