# yatai-chart
Helm Chart for installing YataiService on Kubernetes

## Prerequisite

- *Kubernetes 1.16+*
- *Helm 3+*

## Installation

Make sure you have a local k8s cluster running before developing the chart. One can use [`minikube`](https://minikube.sigs.k8s.io/docs/)

Install Helm dependencies:
```bash
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx && helm dependency build .
```

Lint helm after making changes to the chart:
```bash
$ helm lint .
```

Dry-run helm installation to test out development:
```bash
$ helm install -f values/postgres.yaml --dry-run --debug yatai-service .
```

Install the helm charts:
```bash
$ helm install -f values/postgres.yaml yatai-service .
```

Uninstall the charts:
```bash
$ helm uninstall yatai-service
```