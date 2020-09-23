#!/bin/bash

apt-get update
apt-get install -y httpie stress
pip install termdown
curl -L https://k14s.io/install.sh | bash

cd /root
git clone https://github.com/dockersamples/example-voting-app.git
cp -pfv ./example-voting-app/docker-compose.yml{,.orig}

echo "deploy complete"
