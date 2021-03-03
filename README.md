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
  - web application:  <span style="color:green">31081 -> 8081 -> 8081
  - job:              <span style="color:green">31041 -> 4041 -> 4041

###environment exposed url:
- k8s api:            http://localhost:6550
- docker registry ui: http://localhost:8086/containers  
  - curl -X GET http://registry.local:5000/v2/_catalog
  - curl -X GET http://registry.local:5000/v2/spark/manifests/2.4.4
  - curl -v --silent -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -X GET http://registry.local:5000/v2/spark/manifests/2.4.4 2>&1 | grep Docker-Content-Digest | awk '{print ($3)}'
  - curl -v --silent -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -X DELETE http://registry.local:5000/v2/spark/manifests/sha256:b13e3923003620c5c2df00438f0288874663d8b64bd03003cf0dc1a2d367e4eb

- spark ui:           http://localhost:31080
- zeppelin:           http://localhost:31081

###help urls:
- https://kubernetes:io/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/:
