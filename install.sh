#!/bin/bash

printf "\n# This script installs uhubctl\n"

sudo apt-get install -y libusb-1.0-0-dev

sudo git clone https://github.com/mvp/uhubctl.git
cd uhubctl
sudo make
sudo make install
cd ..

printf "\n# Copy logrotate config\n"
sudo cp reboot-usb-devices.logrotate /etc/logrotate.d/reboot-usb-devices


printf "\n# Install Nikon Service\n"
sudo cp check_nikon.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start check_nikon.service
sudo systemctl enable check_nikon.service
