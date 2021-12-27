# yatai-chart
Helm Chart for installing YataiService on Kubernetes

## Prerequisite

- *Kubernetes 1.18+*
- *Helm 3+*

## Installation

Make sure you have a local k8s cluster running before developing the chart. One can use [`minikube`](https://minikube.sigs.k8s.io/docs/)


#### Start minikube
```bash
minikube start --memory=8192 --cpus=8
```

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
helm install yatai yatai/yatai -n yatai-system --create-namespace
```

#### Uninstall Yatai

```bash
./delete-yatai.sh
```


## How to update artifacthub listing

1. Update the version in `Chart.yaml`


2. Run generate index.yaml and .tgz file command
```bash
make generate
```

3. Make PR to the repo.  Aritfact hub will check repo change every 15 mins

