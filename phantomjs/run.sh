#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`

/host/phantomjs/bin/phantomjs ${DIR}/job.js
timeout 180 /host/phantomjs/casper/bin/casperjs selftest
