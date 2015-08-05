# Installing BladeRF on Mac

Getting the BladeRF to run on Mac OSX Yosemite 10.10.4.  Xcode is installed alone with X11 as specified by Nuand.


```shell
# install dependencies
brew install libusb pkgconfig cmake libtecla

# clone and bulid
git clone https://github.com/Nuand/bladeRF.git
cd ./bladerf
cd host
mkdir build; cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/local ..
make
sudo make install
```

### Homebrew

I originally wanted to install this with Homebrew from [```edy555/bladerf```](https://github.com/edy555/homebrew-bladerf) but was not able to get it to work.  I kept getting an compile error.

### Testing

You should now be able to run the ```bladeRF-cli``` like this:

```shell
# probe for connected bladerf
./bladRF-cli -p
```
> I ran into issues here.  The file needs the proper permissions.  Either run as sudo or go to ```/opt/local/bin/``` and exectute ```sudo chown <user> bladeRF-cli```
