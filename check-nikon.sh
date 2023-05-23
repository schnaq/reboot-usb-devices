#!/bin/bash

BASE=/opt/reboot-usb-devices

echo "$(date): Checking for Nikon Cameras" >> $BASE/logs/reboot-usb-devices.log

sudo rm $BASE/reboot.lock

while true
do
  gphoto2 --auto-detect | grep Nikon
  if [ $? -eq 0 ]
  then
    echo "$(date): Nikon found" # >> $BASE/logs/reboot-usb-devices.log
  else
    echo "$(date): Nikon not found" >> $BASE/logs/reboot-usb-devices.log
    /bin/bash $BASE/reboot-usb.sh &
  fi
  sleep 1
done
