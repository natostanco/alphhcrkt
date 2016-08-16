#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`
 export SLIMERJSLAUNCHER=/usr/bin/firefox

/host/phantomjs/bin/phantomjs ${DIR}/job.js
timeout 180 /host/phantomjs/casper/bin/casperjs selftest
timeout 180 xvfb-run /host/phantomjs/casper/bin/casperjs selftest --engine=slimerjs
python /host/phantomjs/selftest.py
