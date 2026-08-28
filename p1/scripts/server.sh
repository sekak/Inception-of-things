#!/bin/bash

set -e

echo "================================="
echo " Installing K3s SERVER"
echo "================================="

apt-get update -y
apt-get install -y curl

curl -sfL https://get.k3s.io | \
INSTALL_K3S_EXEC="server \
--node-ip 192.168.56.110 \
--advertise-address 192.168.56.110 \
--write-kubeconfig-mode 644" sh -

echo "Waiting for K3s token..."

rm -f /vagrant/confs/token

while [ ! -f /var/lib/rancher/k3s/server/token ]; do
    sleep 2
done

cp /var/lib/rancher/k3s/server/token  /vagrant_shared/token


echo "================================="
echo " K3s SERVER installed"
echo "================================="