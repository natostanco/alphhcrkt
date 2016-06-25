#!/bin/bash

set -ev

SAVE=$1
cnt=$2
slim=$3
pkg=$4

docker build -t $cnt .

docker run -it --rm -v $SAVE:/host --entrypoint "/bin/bash" $cnt "/host/scripts/lister.sh" "$pkg"

$SAVE/phantomjs/phantomjs.sh

sudo ./docker-slim build \
	--entrypoint "/bin/bash" \
	--cmd "/host/scripts/toucher.sh" \
	--mount $SAVE:/host \
	--include-path /etc/ssl \
	--continue-after 30 \
	--http-probe $cnt


