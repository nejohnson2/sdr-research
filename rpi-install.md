# Using RTLSDR with a Raspberry Pi

Here are some note about getting the Realtek RTLSDR up and running on a Raspberry Pi. Its surprisingly easly!  
I'm using the original RPi and this works!

> Note:  You will need an sd card larger than 4gb!

### Install Raspian Wheezy

Setup the RPi as you normally would with the Raspian Wheezy image.  I usually have success using [Pi filer](http://ivanx.com/raspberrypi/)

### Upgrade Wheezy to Jessie

This takes a long time. First edit the file ```/etc/apt/sources.list``` and add the following:

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
# bladerf dependencies
sudo apt-get install libusb-1.0-0-dev libusb-1.0-0 build-essential cmake libncurses5-dev libtecla1 libtecla-dev wget

# dependencies for libosmocore
sudo apt-get install libtool shtool autoconf automake gcc
sudo apt-get install libpcsclite-dev

# gr-gsm dependencies
sudo apt-get install libboost-all-dev libcppunit-dev swig doxygen liblog4cpp5-dev python-scipy

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
git clone https://github.com/ptrkrysik/gr-gsm.git ./gr-gsm

cd gr-gsm
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
```

Create and/or edit ```~/.gnuradio/config.conf``` and add the following:

```
[grc]
local_blocks_path=/usr/local/share/gnuradio/grc/blocks
```

**Fails**.  After all of that, it seems ```gr-gsm``` does not work correctly.  [This blog](https://batilanblog.wordpress.com/2015/02/17/using-ec3k-with-raspberry-pi/) describes a bit of the problem.  I was receiving this error:

```
Using Volk machine: generic
VOLK: Error allocating memory (posix_memalign: 22)
Segmentation fault
```

To get around it you will need to recompile gnuradio from source with a patch.

```
# get gnuradio source
wget http://gnuradio.org/releases/gnuradio/gnuradio-3.7.5.tar.gz
tar xvzf gnuradio-3.7.5.tar.gz
cd gnuradio-3.7.5.tar.gz

# get patch file
wget http://gnuradio.org/redmine/attachments/download/821/0001-volk-Fix-volk_malloc-when-alignment-is-1.patch
patch -p1 < *volk*.patch
```

Now rebuild gnuradio with patch:

```
mkdir build
cd build
cmake -DENABLE_DEFAULT=Off -DENABLE_VOLK=True -Dhave_mfpu_neon=0 ..
make
sudo make install
```

Test with RTLSDR:

```
airprobe_rtlsdr.py
```

