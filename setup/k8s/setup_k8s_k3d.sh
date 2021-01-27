#!/bin/bash
SETUP_FOLDER=$(dirname "${BASH_SOURCE[0]}")/..
FILES_FOLDER=${SETUP_FOLDER}/_files
source "${SETUP_FOLDER}/util.sh"

K3D_VERSION=v4.0.0
#################
###### K3D ######
#################
# https://k3d.io/usage/commands/

###### k3d image ######
function install_k3d() {
  K3S=/usr/local/bin/k3d
  if [ ! -f "$K3S" ]; then
    echo "---> $K3S not exist - installing K3S ..."
    sudo wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=${K3D_VERSION} bash
  else
    echo "vvv $K3S already installed vvv"
  fi

  k3d version
}

###### k3d create cluster ######
function delete_k3d_cluster() {
  k3d cluster delete ginger
}

function create_k3d_cluster() {
  export KUBECONFIG=
  k3s_container="$(docker ps --format 'table {{.Names}}' | grep k3d)"
  if [ -z "${k3s_container}" ]; 	then
	  echo "---> K3D cluster not exist - Creating new  K3S cluster ..."

    sudo cp -rfv "${FILES_FOLDER}/home/elevy/k3d" ~/
    sudo chmod 777 -R ~/k3d

    #	k3d cluster delete ginger
	  k3d --verbose cluster create ginger --api-port 6550 -p "30000-32767:30000-32767@server[0]"  --agents 2 --registry-config "/home/elevy/k3d/registries.yaml" --network ginger-network

	  #### -l "add-host=host.docker.internal:172.17.0.1@server[0]"

    #https://github.com/moby/moby/pull/40007


    # create new k3d config file /home/elevy/.k3d/kubeconfig-ginger.yaml
    k3d kubeconfig merge ginger --switch-context

    #  export KUBECONFIG="$(k3d kubeconfig get ginger)"
    # it will create new k3d config file /home/elevy/.kube/config.yaml

    # After cluster created you can check the expose api under: (password taken from /home/elevy/.k3d/kubeconfig-ginger.yaml)
    # https://0.0.0.0:6550 admin/4bca390983c31f091a997655482832fb
	else
	  echo "k3s_container=$k3s_container is RUNNING"
	fi

  docker ps -a
  curl localhost:6550/
}

###### install nginx ######
function install_nginx(){
    kubectl create deployment nginx --image=nginx
    kubectl create service clusterip nginx --tcp=80:80
    kubectl apply -f /home/elevy/k3d/ingress.yaml
    curl localhost:8081/
}

###### update zsh file ######
function copy_my_k8s_file(){
    sudo cp -rfv "${FILES_FOLDER}/home/elevy/.k8s" ~/

    if ! grep -rnw "/home/elevy/.zshrc" -e "source ~/.k8s" ; then
    echo "---> Update ~/.zshrc file with .k8s file ..."
    {
      echo 'source ~/.k8s'
    } >> /home/elevy/.zshrc
  else
    echo "vvv ZSH is updated with my k8s starter "
  fi
}
