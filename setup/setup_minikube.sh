#!/bin/bash
##################################################
# print each command before running it
#set -v
#set -x

# this declared that the current user is docker-compose.yaml sudoer
PASSWORD=elevy
# echo $PASSWORD | sudo tee /etc/sudoer.d/$USER <<END
# END
##################################################
pushd "$(dirname "$0")" >/dev/null || exit
##################################################

#ROOT = /opt/dev/dotfiles/01_new_laptop
SETUP_FOLDER=$(pwd)
echo "SETUP_FOLDER=${SETUP_FOLDER}"

source "${SETUP_FOLDER}/util.sh"
source "${SETUP_FOLDER}/docker/setup_docker.sh"
source "${SETUP_FOLDER}/kubectl/setup_kubectl.sh"
source "${SETUP_FOLDER}/k8s/setup_minikube.sh"
source "${SETUP_FOLDER}/k8s/setup_k9s.sh"
source "${SETUP_FOLDER}/helm/setup_helm.sh"
##################################################

#ask docker_prune
#ask remove_docker
#ask add_docker_repository
#ask install_docker
#ask install_docker_compose
#notinuse ask create_docker_local_registry
#ask create_docker_compose_local_registry


#ask install_kubectl
ask install_minikube
ask start_minikube_cluster
#ask install_nginx
#ask install_k9s
#ask install_helm
#ask copy_my_k8s_file

##################################################
set +x
popd >/dev/null || exit
##################################################

