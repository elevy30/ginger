#!/usr/bin/env bash
#set -v

##################################################
pushd `dirname "$0"` > /dev/null

cd ./docker
docker build -t registry.local:5000/zeppelin-server:0.10.0 .
docker push registry.local:5000/zeppelin-server:0.10.0

##################################################
set +x
popd >/dev/null || exit
##################################################