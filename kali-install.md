# Kali Install

@(SDR Research)

After many attemps to install GNU Radio on various types of Ubuntu versions, we've decided to use Kali.  This comes prebuilt with GNU Radio and all kinds of goodness.  We're using Kali 1.1.0 found [here](http://docs.kali.org/installation/kali-linux-live-usb-persistence)

Unfortunately, not everything is installed.  When booting up Kali, run the following:

```shell
sudo apt-get update && apt-cache search kali-linux
```

From the options, install:

```
sudo apt-get install kali-linux-sdr
```

Now we can go through and install libosmocore and Airprobe.

```shell
git clone git://git.osmocom.org/libosmocore.git
```
Then, to compile as a standalone:

```shell
cd libosmocore/
autoreconf -i
./configure
make
sudo make install
cd ..
```

Now install Airprobe (see notes).

> **Note:**  Install Airprobe outside of libosmoco directory

## Running Everything
 
 Launch GQRX in order to find a channel to listen.  Record the channel to be used by Airprobe later.  Below are a list of channels that we found strong signals:
 
#### GQRX Settings:
Sample Rate: 150,000
AGC: Fast
Filter: Normal
Mode: Narrow FM
FFT: 4096
Rate: 15fps

#### Uplink Channels:
824 MHz - 849 MHz is the uplink spectum.  850 - 875 is the downlink.  Interestingly, the 850 MHz spectrum is owned by AT&T and Verizon.  Check out the [FCC website](http://reboot.fcc.gov/) to see some more interesting things about the spectrum.

#####Our Channels:
    827.610 MHz
824.939 MHz
833.296 MHz
835.200 MHz
840.000 MHz
847.779 MHz


Navigate to the folder ```/aiprobe/gsm-receiver/src/python``` and download [this file](http://sdr.osmocom.org/trac/attachment/wiki/rtl-sdr/rtl2832-cfile.grc).  This file will convert a ```.bin``` file into a ```cfile```

Run the ```cfile``` and open Wireshark.

```shell
./gsm_recieve -I <filename> -d 64
```

This will get a file which converts into GNU Radio Companion allowing you to import recorded files into GRC.  Now open Wireshark as root user:

```shell
sudo wireshark
```

In the Wireshark interface settings list, select ```lo```.  In wireshark filter, use ```gsmtap```.  Then run:

```shell
./gsm_receive_rtl.py -s 1e6
```
This should start an app which we will then tune to a frequency.  We used 827.610 MHz

If recording from
```shell
./rtl_sdr <file_name> .bin -s <sampling rate> -f <frequency>
```

