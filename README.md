# yatai-chart
Helm Chart for installing YataiService on Kubernetes

## Prerequisite

- *Kubernetes 1.18+*
- *Helm 3+*


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
wget https://https://bentoml.github.io/yatai-chart/delete-yatai.sh
chmod +x delete-yatai.sh
./delete-yatai.sh
```
