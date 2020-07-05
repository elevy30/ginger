cd helm/charts

helm install ginger-spark spark
helm install ginger-hadoop hadoop
helm install ginger-jupyter jupyterhub


k port-forward services/ginger-spark-webui 8088:8088 &
k port-forward services/ginger-spark-zeppelin 9000:8080 &
k port-forward services/ginger-jupyter-proxy-public 8888:80 &

k port-forward -n local ginger-hadoop-hadoop-yarn-rm-0 8081:8088 &

#helm uninstall ginger-spark