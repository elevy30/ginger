 #!/usr/bin/env zsh

./spark-2.4.5/bin/docker-image-tool.sh -r registry.local:5000 -t spark-2.4.5 build
./spark-2.4.5/bin/docker-image-tool.sh -r registry.local:5000 -t spark-2.4.5 push