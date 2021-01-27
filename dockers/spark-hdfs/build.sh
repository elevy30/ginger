#!/usr/bin/env bash
#set -v

##################################################
pushd `dirname "$0"` > /dev/null

cd ../spark-hdfs/docker
docker build . -t spark:2.4.4
docker push registry.local:5000/spark:2.4.4

##################################################
set +x
popd >/dev/null || exit
##################################################