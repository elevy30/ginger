#!/bin/bash
SETUP_FOLDER=$(dirname "${BASH_SOURCE[0]}")/..
FILES_FOLDER=${SETUP_FOLDER}/_files
source "${SETUP_FOLDER}/util.sh"


#################
###### MINIKUBE ######
#################

###### MINIKUBE  ######
function install_minikube() {
  MINIKUBE= /usr/local/bin/minikube
  if [ ! -f "$MINIKUBE" ]; then
    echo "---> $MINIKUBE not exist - installing MINIKUBE ..."
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
  else
    echo "vvv $MINIKUBE already installed vvv"
  fi
}

###### minikube create cluster ######
function delete_minikube_cluster() {
  minikube cluster delete ginger
}

function start_minikube_cluster() {
	  minikube start
}

###### install nginx ######
function install_nginx(){
    kubectl create deployment nginx --image=nginx
    kubectl create service clusterip nginx --tcp=80:80
    kubectl apply -f /home/elevy/minikube/ingress.yaml
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
