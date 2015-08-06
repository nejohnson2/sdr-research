# Random notes

## RTLSDR Scanner

Building on RPi with ```jessie```.  Here is the [gitrepo](https://github.com/EarToEarOak/RTLSDR-Scanner) and here are the [instructions](http://eartoearoak.com/software/rtlsdr-scanner/rtlsdr-scanner-installation#linux).

Newer kernels have a DVB driver included which won't work with the RTLSDR driver, you may need follow these instructuions.  To unload it open an terminal and type:

```shell
sudo rmmod dvb_usb_rtl28xxu
```

To prevent it loading in future:

```shell
sudo su
echo blacklist dvb_usb_rtl28xxu > /etc/modprobe.d/rtlsdr.conf
exit
```

Then:

```shell
sudo apt-get install build-essential python python-wxgtk2.8 python-matplotlib python-numpy python-imaging
sudo pip install pyserial
sudo apt-get install git cmake
sudo apt-get install libusb-1.0-0-dev
```

Now download, build and install the rtlsdr library:

```shell
mkdir build
cd build
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr
mkdir build
cd build
cmake ..
make
sudo make install
cd 
```

For the pyrtlsdr library:

```shell
git clone git://github.com/roger-/pyrtlsdr.git
cd pyrtlsdr
sudo python setup.py install
cd 
```

Then download and run the app:

```shell
git clone https://github.com/EarToEarOak/RTLSDR-Scanner.git
cd RTLSDR-Scanner/scr
python rtlsdr_scanner.py
```

