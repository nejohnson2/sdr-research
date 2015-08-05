# Using BeagleBone Black with RTLSDR

I'm running this on the original Beaglebone and I've flashed Ubuntu onto the system.  See directions to flash below
Running Ubuntu:

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=14.04
DISTRIB_CODENAME=trusty
DISTRIB_DESCRIPTION="Ubuntu 14.04.2 LTS"
NAME="Ubuntu"
VERSION="14.04.02 LTS, Trusty Tahr"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 14.04.2 LTS"
VERSION_ID="14.04"
```

### Update Ubuntu

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential git cmake pkg-config libusb-1.0-0-dev
```

### Build RTL-SDR 

```shell
git clone git://git.osmocom.org/rtl-sdr.git
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
INCOMPLETE

#### Boot Ubuntu 13.10
Download the [image here](http://s3.armhf.com/debian/saucy/bone/ubuntu-saucy-13.10-armhf-3.8.13-bone30.img.xz).  Use PiFiler to install the image onto an microSD card.  

#### Flashing the BBB
After going through this process, I am unable to expand the file system to create a larger partition.  If someone knows how to do that I would greatly appreciate it!

Download the latest .img file [*BBB-eMMC-flasher-ubuntu-14.04.img*](https://rcn-ee.com/rootfs/2015-07-08/flasher/BBB-eMMC-flasher-ubuntu-14.04.2-console-armhf-2015-07-08-2gb.img.xz).  I also use [PiFiler](http://ivanx.com/raspberrypi/) which is designed for Raspberry Pi but works for our purposes here.

**Flash the BBB**
Use PiFiler to install the .img file onto you're clean Fat32 formatted sd card.  (I'm using 16GB).  Eject.  Place in BeagleBone and hold down the User Boot button until all of the LEDs start flashing.  Let go of button.  Let the BBB go for 30-45 mins.  All LEDs will be blue when the flashing is finished. Power off and eject the microSD. 

Reboot without SD.  Now ssh.  Username is *ubuntu* and password is *temppwd*.





