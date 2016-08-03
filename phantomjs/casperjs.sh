#!/bin/bash

casper_V=`awk -f git-describe-remote-ngx.awk https://github.com/casperjs/casperjs  | grep -o "[0-9][^-]*" | head -n 1`
DIR=`dirname "$(readlink -f "$0")"`

wget https://github.com/casperjs/casperjs/archive/${casper_V}.tar.gz -O ${DIR}/casper.tar.gz
tar -xf ${DIR}/casper.zip  -C ${DIR}
rm -f ${DIR}/casper.tar.gz
mv ${DIR}/${casper_V}/* ${DIR}/
