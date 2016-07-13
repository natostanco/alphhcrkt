#!/bin/bash

touch `cat /host/list.txt`
touch `cat /host/manuallist.txt`

/host/phantomjs/run.sh

hhvm --mode server --config /etc/hhvm/php.ini --config /etc/hhvm/server.ini --user www-data -vPidFile=/var/run/hhvm/pid &>/dev/null &

echo '<?php exec("touch /host/yes"); ?>' > /host/test.php
hhvm /host/test.php
