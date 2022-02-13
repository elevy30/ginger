#!/usr/bin/env bash
#set -v
##################################################
pushd `dirname "$0"` > /dev/null

kubectl apply -f spark-master-deployment.yaml
kubectl apply -f spark-master-service.yaml
kubectl apply -f spark-worker-deployment.yaml

#kubectl port-forward spark-master-controller-zd6rl 8088:8080
#kubectl port-forward service/spark-master 8088:8080 &
##################################################
set +x
popd >/dev/null || exit
##################################################