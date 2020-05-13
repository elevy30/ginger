#!/usr/bin/env zsh

pushd `dirname "$0"` > /dev/null
cd spark-2.4.5/
bin/docker-image-tool.sh -r registry.local:5000 -t 2.4.5 build
bin/docker-image-tool.sh -r registry.local:5000 -t 2.4.5 push

popd > /dev/null