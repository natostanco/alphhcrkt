#!/bin/bash
PHANTOMJS_VERSION=2.1.1
DIR=`dirname "$(readlink -f "$0")"`

apt install fontconfig freetype* -y -q

wget -q --no-check-certificate -O ./phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
tar -xjf ./phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C ./
rm -f ./phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
mv ./phantomjs-$PHANTOMJS_VERSION-linux-x86_64/* ./phantomjs
