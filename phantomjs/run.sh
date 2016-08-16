#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`
export SLIMERJSLAUNCHER=/usr/bin/firefox
sed -i 's/MaxVersion=.*/MaxVersion=*/' /host/phantomjs/slimer/src/application.ini
ln -s /host/phantomjs/slimer/src/slimerjs /usr/bin
ln -s /host/phantomjs/bin/phantomjs /usr/bin

/host/phantomjs/bin/phantomjs ${DIR}/job.js
timeout 180 /host/phantomjs/casper/bin/casperjs selftest
xvfb-run /host/phantomjs/slimer/src/slimerjs
sleep 1 ## otherwise consecutive xvfb calls fail
xvfb-run timeout 180 /host/phantomjs/casper/bin/casperjs selftest --engine=slimerjs
python /host/phantomjs/selftest.py

rm /usr/bin/slimerjs
rm /usr/bin/phantomjs
