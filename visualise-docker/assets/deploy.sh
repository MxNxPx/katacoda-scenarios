#!/bin/bash

apt-get update
apt-get install -y httpie stress
pip install termdown

cd /root
wget $(curl -s https://api.github.com/repos/k14s/ytt/releases/latest | egrep "browser_download_url.*linux.*64" | cut -d '"' -f 4) && mv ytt*linux*64 /usr/local/bin/ytt && chmod 755 /usr/local/bin/ytt
git clone https://github.com/dockersamples/example-voting-app.git
cp -pfv ./example-voting-app/docker-compose.yml{,.orig}

echo "deploy complete"
