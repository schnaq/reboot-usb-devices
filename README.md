# Reboot USB Devices

This script installs and configures [uhubctl](https://github.com/mvp/uhubctl).

We want to restart the usb hubs whenever a specific USB device is disconnected,
in this case a Nikon camera.

## Installation

Clone this repo to /opt/reboot-usb-devices

```bash
sudo git clone https://github.com/schnaq/reboot-usb-devices.git /opt/reboot-usb-devices
cd /opt/reboot-usb-devices
```

Install uhubctl with the following command:

```bash
sudo ./install.sh
```

## Check via `gphoto2` for Nikon Connection

Copy the check_nikon.service file to `/etc/systemd/system`. Then reload the
systemd daemon with the following command:

```bash
sudo cp check_nikon.service /etc/systemd/system/
sudo systemctl daemon-reload
```

Then start and enable the service with the following command:

```bash
sudo systemctl start check_nikon.service
sudo systemctl enable check_nikon.service
```
