#!/usr/bin/env bash

# This may crash.  If so, see this issue: https://github.com/Homebrew/homebrew/issues/46000
brew install gnuradio
brew install hackrf

brew tap andresv/homebrew-gnuradio
brew install bladerf --HEAD 
brew install rtlsdr --HEAD 

brew install gr-osmosdr gr-baz --HEAD

mkdir ~/.gnuradio
touch ~/.gnuradio/config.conf 

echo "[grc]" >> ~/.gnuradio/config.conf
echo "local_blocks_path=/usr/local/share/gnuradio/grc/blocks" >> ~/.gnuradio/config.conf

brew install gqrx --HEAD

brew tap dholm/homebrew-sdr

# libosmocore might crash.  Use the forked version nejohnson2/libosmocore
brew install libosmocore --HEAD # dependencies of gr-gsm
brew install gr-gsm --HEAD 

# In order to install gr-gsm properly, I needed to copy the 
# grc block rtlsdr_source.xml to the appropriate folder.  Gnuradio-companion
# still throws a bunch of error but everything works fine.
# cp /usr/local/share/gnuradio/grc/blocks/rtlsdr_source.xml `/usr/local/Cellar/gnuradio/3.7.7.1/share/gnuradio/grc/blocks/rtlsdr_source.xml

brew linkapps

git config --global user.name "Nicholas Johnson"
git config --global user.email "nejohnson2@gmail.com"
