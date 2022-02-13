#!/usr/bin/env bash
#set -v
##################################################
pushd `dirname "$0"` > /dev/null

kubectl apply -f zeppelin-configmap.yaml
kubectl apply -f zeppelin-deployment.yaml
kubectl apply -f zeppelin-service.yaml
kubectl apply -f zeppelin-role.yaml

##################################################
set +x
popd >/dev/null || exit
##################################################