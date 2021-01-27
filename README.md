# k8s
k8s playground

- first step: 

  -- create your local k8s env see [here](./setup/README.md) 

###environment exposed ports:
- docker 
  - registry:      <span style="color:green;">5000 
- k3d
  - services:     <span style="color:green">30000-32767
  - api port:     <span style="color:green">6550
- spark
  - spark ui:     <span style="color:green">31080 -> 8080 -> 8080
  - spark master: <span style="color:green">31077 -> 7077 -> 7077
  - spark job:    <span style="color:green">31040 -> 4040 -> 4040
- zeppelin
  - web application:  <span style="color:green">31180 -> 8180 -> 8080
  - job:              <span style="color:green">31140 -> 4140 -> 4040

###environment exposed url:
- k8s api:            http://localhost:6550
- docker registry ui: http://localhost:8086/containers

#curl -X GET https://registry.local:5000/v2/_catalog
#curl -X GET http://registry.local:5000/v2/spark/manifests/2.4.4

###help urls:
- https://kubernetes:io/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/:
