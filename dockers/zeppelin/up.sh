#!/usr/bin/env bash
#set -v

##################################################
pushd `dirname "$0"` > /dev/null

cd ../zeppelin/docker-compose
docker-compose up

##################################################
set +x
popd >/dev/null || exit
##################################################