#!/bin/bash

printf "\n# This script installs uhubctl\n"

sudo apt-get install -y libusb-1.0-0-dev

git clone https://github.com/mvp/uhubctl.git
cd uhubctl
make
sudo make install
cd ..
