#!/bin/bash
# Downloading master
VERSION=1.0.3
URL=https://github.com/nekolover/tangledstrings/archive/master.tar.gz

if [[ "${1}" == '-r' ]] ; then
    VIMPATH=usr/share/vim/vimfiles
    TARGET=rpm
    VIMDEP=vim-enhanced
else
    VIMPATH=usr/share/vim/vim73
    TARGET=deb
    VIMDEP=vim
fi

rm -rf build usr && mkdir -p build ${VIMPATH}
cd build
wget ${URL} -O tangledstrings-${VERSION}.tar.gz
tar xf tangledstrings-${VERSION}.tar.gz
cd tangledstrings-master

# Preparing 
cp -r doc plugin ../../${VIMPATH}
cd ../../..

fpm -n vim-tangledstrings -v ${VERSION} -a all -C tangledstrings-packaging -m "<jonathan.raffre@smile.fr>" --description "Vim Puppet management detector" --url 'https://github.com/nekolover/tangledstrings' -t ${TARGET} -d $VIMDEP -d puppet -s dir usr

