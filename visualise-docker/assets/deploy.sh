#!/bin/bash

apt-get update
apt-get install -y httpie stress
pip install termdown

cd /root
wget $(curl -s https://api.github.com/repos/k14s/ytt/releases/latest | egrep "browser_download_url.*linux.*64" | cut -d '"' -f 4) && mv ytt*linux*64 /usr/local/bin/ytt && chmod 755 /usr/local/bin/ytt

git clone https://github.com/dockersamples/example-voting-app.git
cp -pfv ./example-voting-app/docker-compose.yml{,.orig}

git clone https://github.com/Dynatrace/easyTravel-Docker.git
cp -pfv ./easyTravel-Docker/docker-compose.yml{,.orig}

cat <<'EOF' >>/root/.bash_profile
source /root/.bashrc

prompt_command() {
  _PS1_expire=3540
  _PS1_now=$(expr `date +%s` - `stat -c %Y /tmp/d`)
  if [ $(expr $_PS1_expire - $_PS1_now) -lt 300 ]; then
    PS1=$( printf "\[\e[0;31m\]<5--MINS--LEFT! \W>\[\e[1;37m\] ")
  else
    PS1=$( printf "\[\e[0;32m\]%02d:%02d \W>\[\e[1;37m\] " \
           $(( (( _PS1_expire - _PS1_now ) % 3600) / 60 )) \
           $((  ( _PS1_expire - _PS1_now ) % 60))           \
       )
  fi
}
PROMPT_COMMAND='prompt_command'
EOF

echo "deploy complete"
