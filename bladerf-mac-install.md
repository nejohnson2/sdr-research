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
