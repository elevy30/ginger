#!/usr/bin/env bash
#set -v

##################################################
pushd `dirname "$0"` > /dev/null

helm uninstall airflow
##################################################
set +x
popd >/dev/null || exit
##################################################









