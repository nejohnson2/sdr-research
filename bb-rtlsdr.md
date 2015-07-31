# Using BeagleBone Black with RTLSDR

I'm running this on the original Beaglebone and I've flashed Ubuntu onto the system.  I dont remember how...I'll post about that someday.
Running Ubuntu:

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=12.04
DISTRIB_CODENAME=precise
DISTRIB_DESCRIPTION="Ubuntu 12.04.5 LTS"
NAME="Ubuntu"
VERSION="12.04.5 LTS, Precise Pangolin"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu precise (12.04.5 LTS)"
VERSION_ID="12.04"
```

### Update Ubuntu

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essentials git cmake pkg-config libusb-1.0-0-dev
```

### Build RTL-SDR 

```shell
git clone git://gitosmocom.org/rtl-sdr.git
cd rtl-sdr 
cmake ./ -DINSTALL_UDEV_RULES=ON
sudo make
sudo make install
sudo ldconfig
```

### Optional

[Dump1090](https://github.com/antirez/dump1090) is a library that lets you decode nearby aircraft signals.  The libary has an option to run a server which lets you visualize the air craft on a map.  Another, and better version was forked [here](https://github.com/MalcolmRobb/dump1090)

```shell
git clone https://github.com/antirez/dump1090.git
cd dump1090
sudo make
```

Run dump1090

```shell
sudo ./dump1090 --interactive --net --net-http-port 8081
```

Now open up a browser and navigate to the IP of the Beaglebone at port 8081.

### Setting up the BeagleBone Black

Download the latest .img file [*Ubuntu Saucy 13.10*](http://www.armhf.com/downloads-old/).  Unfortunately I can't find the Ubuntu 14.04 Trusty .img file anywhere and I dont know how to use the binary file to get the BB operating.  I also use [PiFiler](http://ivanx.com/raspberrypi/) which is designed for Raspberry Pi but works for our purposes here.

Use PiFiler to install the .img file onto you're clean Fat32 formatted sd card.  (I'm using 16GB).  Eject.  Place in BeagleBone and hold down the User Boot button until all of the LEDs start flashing.  
