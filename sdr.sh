#!/usr/bin/env bash

# This may crash.  If so, see this issue: https://github.com/Homebrew/homebrew/issues/46000
brew install gnuradio
brew install hackrf

brew tap nejohnson2/homebrew-sdr
brew install bladerf --HEAD 
brew install rtlsdr --HEAD 
brew install gr-osmosdr gr-baz --HEAD

brew install gqrx --HEAD

# Using a forked version nejohnson2/libosmocore because of 
# a bug when installing on OSX 10.11
brew install libosmocore --HEAD # dependencies of gr-gsm
brew install gr-gsm --HEAD 

mkdir ~/.gnuradio
touch ~/.gnuradio/config.conf 

echo "[grc]" >> ~/.gnuradio/config.conf
echo "local_blocks_path=/usr/local/share/gnuradio/grc/blocks" >> ~/.gnuradio/config.conf

# In order to install gr-gsm properly, I needed to copy the 
# grc block rtlsdr_source.xml to the appropriate folder.  Gnuradio-companion
# still throws a bunch of error but everything works fine.
# cp /usr/local/share/gnuradio/grc/blocks/rtlsdr_source.xml `/usr/local/Cellar/gnuradio/3.7.7.1/share/gnuradio/grc/blocks/rtlsdr_source.xml

brew linkapps

git config --global user.name "Nicholas Johnson"
git config --global user.email "nejohnson2@gmail.com"
