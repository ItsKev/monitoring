#!/bin/bash

kind create cluster --config configs/kind-config.yaml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add linkerd https://helm.linkerd.io/stable
helm repo update

helm install kube-prometheus-stack -n monitoring --create-namespace prometheus-community/kube-prometheus-stack --values configs/kube-prometheus-stack-values.yaml
helm install loki-stack --namespace monitoring --create-namespace grafana/loki-stack