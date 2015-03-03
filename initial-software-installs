
# CUSP SDR Research

@(SDR Research)

This note is all about installing software in order to use an Software Defined Radio in city.  This is note complete and take from many different sources.  We are using the [**NooElec RTLSDR**](http://www.ebay.com/itm/NooElec-TV28T-v2-USB-DVB-T-RTL-SDR-Receiver-RTL2832U-R820T-Tuner-MCX-Input-/151096351883?_trksid=p2141725.m3641.l6393) as our SDR.  

An initial proposal paper can be found [here](https://www.overleaf.com/2253670njzrcc#/5772920/)

Our goal with this research note is to be able to install all of the software

We are using Linux 14.04.01

## Order of Operations

**Installing everything on an Ubuntu machine** - we've not been able to get this to work:
- [ ] Install GNU Radio
- [ ] Install Osmocom
- [ ] Install Airprobe
- [ ] Install Wireshark

**Using the GNU Radio Live USB**
- [ ] Install Osmocom 
- [ ] Install Airprobe
- [ ] Patch Airprobe
- [ ] Install Wireshark

## Installing GNURadio from Source
When installing GNU Radio to use with Airprobe, be sure to use GNU Radio version 3.6.  **Airprobe does not work with GNU Radio 3.7**.  However, there is a patch for Airprobe if you need to use GNU Radio 3.7 and can be found [here](https://github.com/scateu/airprobe-3.7-hackrf-patch).  Using this build script is **probably** the best way to go:

[Source](http://gnuradio.org/redmine/projects/gnuradio/wiki/InstallingGRFromSource)

 
```shell
wget http://www.sbrac.org/files/build-gnuradio && chmod a+x ./build-gnuradio && ./build-gnuradio -o
```

Here we are using the -o which will install GNU Radio 3.6 instead of the 3.7 version which has been causing issues and may not be ready to get working properly.

We constantly received an error saying we did not detect **gnuradio-core**.  This  is because Airprobe is not compatible with GNU Radio 3.7.  If you're here, start  over. :)


## Install Osmocom
Installation instructions can be found [here](http://bb.osmocom.org/trac/wiki/libosmocore).

```shell
git clone git://git.osmocom.org/libosmocore.git
```
Compile and install **libosmocore:**
```shell
cd libosmocore/
autoreconf -i
./configure
make
sudo make install
sudo ldconfig
```
If you receive this error:

```shell
configure: error: Package requirements (libpcsclite) were not met
```

Run:

```shell 
sudo apt-get install libsub-dev libpcsclite-dev
```

and this when installing manually...not from Live USB

```shell
sudo apt-get install libusb-0.1-4 libpcsclite1 libccid pcscd
```

---
## Install Airprobe

This is largely taken from [this blog](https://ferrancasanovas.wordpress.com/2014/01/27/airprobe-setup/) which has been really useful in getting all of this setup.

```shell
git clone git://git.gnumonks.org/airprobe.git
```

>**Note:** This git clone may be down. If so, clone this:
> [https://github.com/ksnieck/airprobe.git](https://github.com/ksnieck/airprobe.git) 

**Install gsmdecoder:**
```shell
cd libosmocore/airprobe/gsmdecode
./bootstrap
./configure
make
```
**Install gsm-receiver:**
```shell
cd ..
cd gsm-receiver
./bootstrap
./configure
make
```

## GNU Radio Live Environment

After much frustration, we installed GNU Radio 3.7 on a live USB.  Then we booted into this USB.  This will not save anything we do but might be easier to get things working.  We did this just to test.  
>**Note:** Ubuntu default disk reader doesnt work for creating a live USB so we used [Unetbootin](http://unetbootin.sourceforge.net/)


## Patching Airprobe

Before patching Airprobe, be sure to install **libosmocore**

Download the patch [www.speedyshare.com/9rYp7/zmiana.path](www.speedyshare.com/9rYp7/zmiana.path)

```shell
cd airprobe
patch -p1 < ~/hackrf/01Book/files/GSM/zmiana.patch
```
## Installing Wireshark

```shell
sudo apt-get install wireshark
```

## Using this system

Now that everything is installed (and you've now pulled out all of your hair getting it to work), plug in the USB device.

Make sure the usb device is being detected:
```shell
lsusb
```

To start getting data from device, browse to the location where airprobe is installed **/gsm-receiver/src/python** and run command:

```shell
./gsm_receive_rtl.py -s 1e6
```
>**Note:** We received an error initially saying:   `cannot import name blks2` and ended here!



> **Note:** Our device has an offset of ```-26.945 ppm```

found through kalibrate