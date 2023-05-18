#!/usr/bin/env bash

export PATH=$PATH:/root/.cargo/bin/crunchy-cli
# shellcheck disable=SC1090
source ~/.profile

if [ -z "$COOKIE" ]; then
 echo "Set the cookie in the .env file and run again"
else
 mkdir -p /downloads && cd /downloads || exit
 # shellcheck disable=SC2086
 crunchy-cli --etp-rt $COOKIE login
 source /download.sh
fi;
