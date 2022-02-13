kubectl apply -f bb.yaml
kubectl get deployments
kubectl get services

k port-forward service/bb-entrypoint 30001:30001

kubectl delete -f bb.yaml