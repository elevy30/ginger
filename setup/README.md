#### - install ubuntu on window

#### - install docker on window

#### - install docker
https://medium.com/@sebagomez/installing-the-docker-client-on-ubuntus-windows-subsystem-for-linux-612b392a44c4

#### - make sure docker ps working 'docker ps'

#### - add to .zshrc/.profile
export DOCKER_HOST=tcp://localhost:2375

#### - install k3d (k3s on docker)

#### - install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

#### - add autocomplete to zsh/.profile:
source <(kubectl completion zsh)

alias k=kubectl

complete -F __start_kubectl k

#### - install kubectx/kubens
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx

sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

#### - install k9s
https://github.com/derailed/k9s/releases

sudo ln -s /opt/k9s/k9s /usr/local/bin/k9s

chmod 777 /opt/k9s/k9s

mkdir ~/.k9s

copy config.yml ~/.k9s/

copy hotkey.yml ~/.k9s/


