#!/bin/bash

while read in;
do
  touch "$in";
done < /host/list.txt

/host/phantomjs/run.sh

hhvm --mode server --config /etc/hhvm/php.ini --config /etc/hhvm/server.ini --user www-data -vPidFile=/var/run/hhvm/pid
