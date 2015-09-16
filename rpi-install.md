# Using RTLSDR with a Raspberry Pi

Here are some note about getting the Realtek RTLSDR up and running on a Raspberry Pi. Its surprisingly easly!  
I'm using the original RPi and this works!

### Install Raspian Wheezy

Setup the RPi as you normally would with the Raspian Wheezy image.

### Upgrade Wheezy to Jessie

That has worked though you might have to add this to your /etc/apt/sources.list file:

```
sudo echo 'deb http://archive.raspbian.org/raspbian jessie main' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
```

When complete (which does take a long time) you should see this:

```
lsb_release -a

Distributor ID: Raspbian
Description:    Raspbian GNU/Linux 8.0 (jessie)
Release:        8.0
Codename:       jessie
```

### Dependencies
There are taken from the bladerf install

```
sudo apt-get install libusb-1.0-0-dev libusb-1.0-0 build-essential cmake libncurses5-dev libtecla1 libtecla-dev pkg-config git wget
```

### Install GNURadio

Very easy...

```
sudo apt-get install gnuradio gnuradio-dev
```

### Instal Bladerf Libraries(untested)
Notes on install bladerf are found [here](https://github.com/Nuand/bladeRF/wiki/Getting-Started%3A-Linux)

```
sudo add-apt-repository ppa:bladerf/bladerf
sudo apt-get update
sudo apt-get install bladerf
sudo apt-get install libbladerf-dev
```

### Install RTL Drivers

```
sudo apt-get install rtl-sdr gr-osmosdr
```

### Test

run:

```
rtl_power -f 90M:120M:8k -g 50 -i 2 -e 1h data.csv
```

