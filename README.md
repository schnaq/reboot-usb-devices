# Reboot USB Devices

This script installs and configures [uhubctl](https://github.com/mvp/uhubctl).

We want to restart the usb hubs whenever a specific USB device is disconnected,
in this case a Nikon camera.

## Installation

Install uhubctl with the following command:

```bash
bash install.sh
```

## Check USB Devices

Look for the USB devices with the following command:

```bash
λ lsusb
Bus 002 Device 003: ID 04b0:044c Nikon Corp. NIKON DSC Z 6_2
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

Replace the `idVendor` and `idProduct` in the udev-rule in this repository with
the corresponding values from the `lsusb` command.

Here: `idVendor=04b0` and `idProduct=044c`

## Copy udev rule

Copy the udev rule to `/etc/udev/rules.d`. Then reload the rules with the
following command:

```bash
sudo udevadm control --reload-rules
```

