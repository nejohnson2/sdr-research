# Using RTLSDR with a Raspberry Pi

Here are some note about getting the Realtek RTLSDR up and running on a Raspberry Pi. Its surprisingly easly!  
I'm using the original RPi and this works!

### Install Raspian Wheezy

Setup the RPi as you normally would with the Raspian Wheezy image.

### Upgrade Deabian to Jessie

I'm actually not sure the best way to do this.  I've done:

```
sudo apt-get update
sudo apt-get upgrade
```

That has worked though you might have to add this to your /etc/apt/sources.list file:

```
deb http://archive.raspbian.org/raspbian jessie main
sudo apt-get update
sudo apt-get upgrade
```

### Install GNURadio

Very easy...

```
sudo apt-get install gnuradio gnuradio-dev
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

