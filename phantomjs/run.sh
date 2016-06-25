#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`

/host/phantomjs/bin/phantomjs ${DIR}/job.js

