#!/bin/bash

set -e

echo "=== Update system ==="
sudo apt update

echo "=== Install basic tools ==="
sudo apt install -y \
    curl \
    git \
    wget \
    ca-certificates \
    gnupg

echo "=== Install Docker ==="
curl -fsSL https://get.docker.com | sudo sh

sudo usermod -aG docker "$USER"

echo "=== Install kubectl ==="
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "=== Install K3d ==="
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo "=== Installation finished ==="

docker --version
kubectl version --client
k3d version