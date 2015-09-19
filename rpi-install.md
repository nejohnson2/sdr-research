# Using RTLSDR with a Raspberry Pi

Here are some note about getting the Realtek RTLSDR up and running on a Raspberry Pi. Its surprisingly easly!  
I'm using the original RPi and this works!

### Install Raspian Wheezy

Setup the RPi as you normally would with the Raspian Wheezy image.  I usually have success using [Pi filer](http://ivanx.com/raspberrypi/)

### Upgrade Wheezy to Jessie

This takes a long time. First edit the file '''/etc/apt/source.list''' and add the following:

```
deb http://archive.raspbian.org/raspbian jessie main
```
Then:

```
sudo apt-get update
sudo apt-get upgrade
```

When complete, check your version:

```
> cat /etc/*-release

Distributor ID: Raspbian
Description:    Raspbian GNU/Linux 8.0 (jessie)
Release:        8.0
Codename:       jessie
```

### Dependencies
There are taken from the bladerf install

```
sudo apt-get install libusb-1.0-0-dev libusb-1.0-0 build-essential cmake libncurses5-dev libtecla1 libtecla-dev wget
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

### Install Bladerf Libraries

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

Test to make sure bladerf works:

```
bladeRF-cli --version
```

Download the FPGA bitstream file:

> Note: The version depends on your version of bladerf

```
wget https://www.nuand.com/fpga/hostedx40-latest.rbf
bladeRF-cli -l hostedx40-latest.rbf
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

### Install libosmocore (dependencies of gr-gsm)

Installing from source.  This is necessary for gr-gsm.

```
# dependencies
sudo apt-get install libtool shtool autoconf automake gcc
sudo apt-get install libpcsclite-dev

git clone git://git.osmocom.org/libosmocore.git

cd libosmocore
autoreconf -i
./configure
make
sudo make install
sudo ldconfig -i
cd ..
```

### Install gr-gsm
Notes are [here](https://github.com/ptrkrysik/gr-gsm/wiki/Installation).  We are installing from source.

```
# install dependencies
sudo apt-get install cmake libboost-all-dev libcppunit-dev swig doxygen liblog4cpp5-dev python-scipy

git clone https://github.com/ptrkrysik/gr-gsm.git ./gr-gsm

cd gr-gsm
mkdir build
cd build
cmake ..
make
sudo make install
```

Test with RTLSDR:

```
airprobe_rtlsdr.py
```

