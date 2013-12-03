#!/bin/bash
# Downloading master
VERSION=1.0.3
URL=https://github.com/nekolover/tangledstrings/archive/master.tar.gz

# Downloading
mkdir -p build usr/share/vim/vim73
cd build
wget ${URL} -O tangledstrings-${VERSION}.tar.gz
tar xf tangledstrings-${VERSION}.tar.gz
cd tangledstrings-master

# Preparing 
cp -r doc plugin ../../usr/share/vim/vim73
cd ../../..

fpm -n vim-tangledstrings -v ${VERSION} -a all -C tangledstrings-packaging -m "<jonathan.raffre@smile.fr>" --description "Vim Puppet management detector" --url 'https://github.com/nekolover/tangledstrings' -t deb -d vim -d puppet -s dir usr

