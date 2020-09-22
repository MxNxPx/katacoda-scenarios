#!/bin/bash

apt-get update
apt-get install -y httpie stress
pip install termdown
curl -L https://k14s.io/install.sh | bash
