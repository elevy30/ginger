#!/usr/bin/env bash
#set -v

##################################################
pushd `dirname "$0"` > /dev/null

docker pull apache/zeppelin:0.9.0
docker tag apache/zeppelin:0.9.0 registry.local:5000/zeppelin:0.9.0
docker push registry.local:5000/zeppelin:0.9.0

##################################################
set +x
popd >/dev/null || exit
##################################################