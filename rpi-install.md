# Using RTLSDR with a Raspberry Pi

Here are some note about getting the Realtek RTLSDR up and running on a Raspberry Pi. Its surprisingly easly!  
I'm using the original RPi and this works!

### Install Raspian Wheezy

Setup the RPi as you normally would with the Raspian Wheezy image.  I usually have success using [Pi filer](http://ivanx.com/raspberrypi/)

### Upgrade Wheezy to Jessie

This takes a long time.

```
sudo echo 'deb http://archive.raspbian.org/raspbian jessie main' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
```

When complete, check your version:

```
> lsb_release -a

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

Test version:
```
> gnuradio-companion --version

GNU Radio Companion 3.7.5
```

### Instal Bladerf Libraries(untested)

Installing from source:
```
git clone https://github.com/Nuand/bladeRF.git ./bladeRF
cd ./bladeRF
cd host/
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_UDEV_RULES=ON ../
make && sudo make install && sudo ldconfig
```

**Fails - the code below fails because the bladerf repository does not exist for Raspbian/jessie**

Notes on install bladerf are found [here](https://github.com/Nuand/bladeRF/wiki/Getting-Started%3A-Linux)

```
# dependencies
sudo apt-get install software-properties-common 
sudo apt-get install python-software-properties

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

### Install gr-gsm
Notes are [here](https://github.com/ptrkrysik/gr-gsm/wiki/Installation)

