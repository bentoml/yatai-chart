# yatai-chart
Helm Chart for installing YataiService on Kubernetes

## Prerequisite

- *Kubernetes 1.18+*
- *Helm 3+*

## Installation

Make sure you have a local k8s cluster running before developing the chart. One can use [`minikube`](https://minikube.sigs.k8s.io/docs/)

Install the helm charts:
```bash
$ helm install yatai . -n yatai-system --create-namespace
```
