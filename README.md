# yatai-chart
Helm Chart for installing YataiService on Kubernetes

## Prerequisite

- *Kubernetes 1.18+*
- *Helm 3+*

## Installation

Make sure you have a local k8s cluster running before developing the chart. One can use [`minikube`](https://minikube.sigs.k8s.io/docs/)


#### Install Helm repo
```bash
helm repo add yatai https://bentoml.github.io/yatai-chart
```

#### Update Helm repo
```bash
helm repo update
```

#### Install Helm chart to Kubernetes cluster

```bash
helm install yatai/yatai-chart -n yatai-system --create-namespace
```

#### Uninstall Yatai

```bash
helm uninstall yatai
```
