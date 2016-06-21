#!/bin/bash

SAVE=$1
cnt=$2
slim=$3
pkg=$4

docker build -t $cnt .

docker run -it --rm -v $SAVE:/host --entrypoint "/bin/bash" $cnt "/host/scripts/lister.sh $pkg"

sudo ./docker-slim build \
	--entrypoint "/bin/bash" \
	--cmd "/host/scripts/toucher.sh" \
	--mount $SAVE:/host \
	--continue-after 30 \
	--http-probe $cnt


