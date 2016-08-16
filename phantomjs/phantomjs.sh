#!/bin/bash
PHANTOMJS_VERSION=2.1.1
DIR=`dirname "$(readlink -f "$0")"`

sudo apt-get update && sudo apt-get install vim wget bzip2 fontconfig freetype* -y -q

wget --no-check-certificate -O ${DIR}/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
tar -xjf ${DIR}/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C ${DIR}
rm -f ${DIR}/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
mv ${DIR}/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/* ${DIR}/

casper_V=`awk -f ${DIR}/git-describe-remote-casper.awk https://github.com/casperjs/casperjs  | grep -o "[0-9][^-]*" | head -n 1`

wget --no-check-certificate https://github.com/casperjs/casperjs/archive/${casper_V}.tar.gz -O ${DIR}/casper.tar.gz
tar -xf ${DIR}/casper.tar.gz  -C ${DIR}
rm -f ${DIR}/casper.tar.gz
mkdir -p ${DIR}/casper
mv ${DIR}/casperjs-${casper_V}/* ${DIR}/casper

slimer_V=`awk -f ${DIR}/git-describe-remote-slimer.awk https://github.com/laurentj/slimerjs | grep -o "[0-9][^-]*" | head -n 1`

wget --no-check-certificate https://github.com/laurentj/slimerjs/archive/${slimer_V}.tar.gz -O ${DIR}/slimer.tar.gz
tar -xf ${DIR}/slimer.tar.gz  -C ${DIR}
rm -f ${DIR}/slimer.tar.gz
mkdir -p ${DIR}/slimer
mv ${DIR}/slimerjs-${slimer_V}/* ${DIR}/slimer
