#!/bin/bash

set -e

sudo apt update -q
      sudo apt install curl -y -q
      curl -fsSL https://get.docker.com | sh -
      sudo systemctl enable --now docker.service
      sudo systemctl enable --now containerd.service
      sudo systemctl start docker

      # Install K3d
      curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | sudo bash
      sudo k3d cluster create dev-cluster --port 8888:8888@loadbalancer --port 8080:80@loadbalancer --agents 2
      
      # Install kubectl
      curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
      chmod +x kubectl
      sudo mv ./kubectl /usr/local/bin
      
      # Create namespaces
      sudo kubectl create namespace argocd
      sudo kubectl create namespace dev

      # Install Argo CD
      sudo kubectl apply -n argocd -f /vagrant/confs/install.yaml

      ## Wait for Argo CD to be ready
      sudo kubectl wait -n argocd --for=condition=Ready pods --all --timeout=600s
      ##

      sudo kubectl apply -f /vagrant/confs/ingress.yaml -n argocd

      sudo kubectl apply -n argocd -f /vagrant/confs/wil.yaml
      sudo kubectl wait --for=condition=Ready pods --all -n argocd
      sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > /vagrant/pass