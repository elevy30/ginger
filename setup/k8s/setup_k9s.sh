#!/bin/bash
SETUP_FOLDER=$(dirname "${BASH_SOURCE[0]}")/..
FILES_FOLDER=${SETUP_FOLDER}/_files
source "${SETUP_FOLDER}/util.sh"

#################
###### K9S ######
#################
function install_k9s() {
  K9S=/usr/local/bin/k9s
  if [ ! -f "$K9S" ]; then
    echo "$K9S not exist - installing K9S......."
    wget https://github.com/derailed/k9s/releases/download/v0.19.4/k9s_Linux_x86_64.tar.gz
    tar xvzf k9s_Linux_x86_64.tar.gz
    rm -rf LICENSE README.md k9s_*
    sudo mv k9s /usr/local/bin/

    sudo cp -rfv "${FILES_FOLDER}/home/elevy/.k9s" ~/
  fi
}




