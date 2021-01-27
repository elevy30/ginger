#!/bin/bash
SETUP_FOLDER=$(dirname "${BASH_SOURCE[0]}")/..
FILES_FOLDER=${SETUP_FOLDER}/_files
source "${SETUP_FOLDER}/util.sh"

#####################
###### KUBECTL ######
#####################
# https://kubernetes.io/docs/tasks/tools/install-kubectl/
function install_kubectl() {
  KUBECTL=/usr/local/bin/kubectl
  if [ ! -f "$KUBECTL" ]; then
    echo "---> $KUBECTL not exist - installing KUBECTL ..."
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
  else
    echo "vvv $KUBECTL already installed vvv"
  fi

  if ! grep -rnw "/home/elevy/.zshrc" -e "kubectl completion zsh" ; then
    echo "---> Update ~/.zshrc file with kubectl ..."
    {
      echo 'source <(kubectl completion zsh)'
      echo 'alias k=kubectl'
      echo 'complete -F __start_kubectl k'
    } >> /home/elevy/.zshrc
  else
    echo "vvv ZSH is updated with kubectl context and alias"
  fi

  echo "---------------> kubectl version --client <---------------"
  kubectl version --client
  echo "---------------> kubectl cluster-info <---------------"
  kubectl cluster-info
  echo "---------------> kubectl config get-contexts <---------------"
  kubectl config get-contexts
  echo "---------------> kubectl get nodes <---------------"
  kubectl get nodes
  echo "---------------> kubectl get namespaces <---------------"
  kubectl get  namespaces
  echo "---------------> kubectl get pods --all-namespaces <---------------"
  kubectl get pods --all-namespaces
}



