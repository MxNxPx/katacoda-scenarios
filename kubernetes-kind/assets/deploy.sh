#!/bin/bash

## install deps
## docker and go should already be installed on katacoda ubuntu image
#eval "$(curl -sL https://raw.githubusercontent.com/travis-ci/gimme/master/gimme | GIMME_GO_VERSION=stable bash)" \
#&& export PATH=$PATH:$HOME/go/bin

## packages (ex: kubectl httpie termdown)
apt-get update \
&& apt-get install -y apt-transport-https \
&& curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
&& echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
&& apt-get update \
&& apt-get install -y kubectl httpie

pip install termdown

## install kind and start cluster
go get -u -v sigs.k8s.io/kind \
&& kind create cluster --config /root/kind-2worker-ephemeral-config.yaml --image kindest/node:v1.16.15 --wait 5m && kubectl wait --timeout=5m --for=condition=Ready nodes --all

echo "deploy complete"
