#!/bin/bash
PHANTOMJS_VERSION=2.1.1
DIR=`dirname "$(readlink -f "$0")"`

apt install fontconfig freetype* -y -q

mkdir ./phantomjs
wget -q --no-check-certificate -O ./phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp
rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ ./phantomjs
