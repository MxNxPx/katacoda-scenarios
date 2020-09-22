#!/bin/bash

#bgfile=/tmp/background.done
#echo "waiting for background script to complete..."
#
#until [ -f $bgfile ]
#do
#     sleep 5
#done
#echo "File found"
#exit


#which termdown
#which httpie
apt-get update
apt-get install -y httpie stress
pip install termdown
curl -L https://k14s.io/install.sh | bash
touch /tmp/background.done

git clone https://github.com/dockersamples/example-voting-app.git
cd example-voting-app/
#docker-compose up -d
#for i in $(seq 1 100); do VAL=$(shuf -n 1 -e a b); echo "VOTING: $VAL"; http --ignore-stdin -h -f POST "localhost:5000" vote=$VAL; done
#termdown -b 55m -f standard -t "< 5   MINS   LEFT!"
