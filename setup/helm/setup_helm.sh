#!/bin/bash
SETUP_FOLDER=$(dirname "${BASH_SOURCE[0]}")/..
FILES_FOLDER=${SETUP_FOLDER}/_files
source "${SETUP_FOLDER}/util.sh"

##################
###### HELM ######
##################
function install_helm() {
  HELM=/usr/local/bin/helm
  if [ ! -f "$HELM" ]; then
    echo "$HELM not exist - installing HELM......."

    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
  fi
}

######################
###### skaffold ######
######################
function install_skaffold() {
  # curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
  # chmod +x skaffold
  # sudo mv skaffold /usr/local/bin
  echo " ----- not implemented ----- "
}



