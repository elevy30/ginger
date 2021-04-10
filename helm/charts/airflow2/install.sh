#!/usr/bin/env bash
#set -v

##################################################
pushd `dirname "$0"` > /dev/null
pwd
#helm dependency update
helm install airflow . --values values-custom.yaml
#helm install airflow .

##################################################
set +x
popd >/dev/null || exit
##################################################









