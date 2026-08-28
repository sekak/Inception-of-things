#!/bin/bash

set -e

echo "================================="
echo " Installing K3s WORKER"
echo "================================="

apt-get update -y
apt-get install -y curl

echo "Waiting for server token..."

while [ ! -f /vagrant/confs/token ]; do
    sleep 2
done

TOKEN=$(cat /vagrant/confs/token)

curl -sfL https://get.k3s.io | \
K3S_URL="https://192.168.56.110:6443" \
K3S_TOKEN="$TOKEN" \
INSTALL_K3S_EXEC="agent --node-ip 192.168.56.111" \
sh -

echo "================================="
echo " K3s WORKER installed"
echo "================================="