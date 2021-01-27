
## Infrastructure Setup
Setup new k3d env with all the k8s tools like k9s and docker repository 
```bash
 cd ../setup/
 ./setup.sh
```

this will deploy all the infrastructure that will needed by k8s env:
- docker
- docker-compose  
- registry
- k3d (with nginx)
- k9s
- kubectl 
- helm

also copy static files to home and usr folder 

---
issue :
1. in order to connect between k3d and registry , I enforced to mention the network...<br>
- https://docs.docker.com/compose/networking/
- https://k3d.io/usage/commands/

k3d:<br>
k3d --verbose cluster create ginger --api-port 6550 -p 8081:80@loadbalancer --agents 2 --registry-config "/home/elevy/k3d/registries.yaml" **--network ginger-network**

registry:<br>
```yaml
version: '3'
services:
docker-registry:
image: registry:2
container_name: registry-local
hostname: registry.local
ports:
- "5000:5000"
volumes:
- "../../_volumes/docker_registry:/var/lib/registry"
restart: always
*networks:
- ginger-network
docker-registry-ui:
image: parabuzzle/craneoperator:latest
container_name: docker-registry-ui
ports:
- "8086:80"
environment:
- REGISTRY_HOST=registry.local
- REGISTRY_PORT=5000
- REGISTRY_PROTOCOL=http
- SSL_VERIFY=false
- USERNAME=admin
- PASSWORD=mypassword
restart: always
*networks:
- ginger-network**
depends_on:
- docker-registry
*networks:
  ginger-network: {
    name: ginger-network
  }
```
https://medium.com/swlh/set-up-docker-registry-and-a-docker-regui-8340bb287276

---


kubectl get event
