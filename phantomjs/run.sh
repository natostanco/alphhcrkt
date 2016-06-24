#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`

/phantomjs/bin/phantomjs ${DIR}/job.js
