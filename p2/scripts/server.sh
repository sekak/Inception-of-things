#!/bin/bash

set -e

echo "[1] Update packages"
apt-get update -y

echo "[2] Install K3s"

curl -sfL https://get.k3s.io | \
INSTALL_K3S_EXEC="server --node-ip=192.168.56.110 --advertise-address=192.168.56.110" \
sh -

echo "[3] Wait for K3s"

until k3s kubectl get nodes >/dev/null 2>&1; do
    echo "Waiting for Kubernetes..."
    sleep 5
done

echo "[4] Apply applications"

echo "[4.1] Create configmaps and apply deployments"
kubectl create configmap app1-html --from-file=index.html=/vagrant_shared/html/app1.html
k3s kubectl apply -f /vagrant_shared/app1.yaml

echo "[4.2] Create configmaps and apply deployments"
kubectl create configmap app2-html --from-file=index.html=/vagrant_shared/html/app2.html
k3s kubectl apply -f /vagrant_shared/app2.yaml

echo "[4.3] Create configmaps and apply deployments"
kubectl create configmap app3-html --from-file=index.html=/vagrant_shared/html/app3.html
k3s kubectl apply -f /vagrant_shared/app3.yaml

echo "[5] Apply Ingress"

k3s kubectl apply -f /vagrant_shared/ingress.yaml

echo "[6] Done"