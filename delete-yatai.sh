#!/bin/bash

echo -e "\033[01;31mWarning: this will permanently delete all Yatai resources, existing model deployments, and in-cluster minio, postgresql DB data. Note that external DB and blob storage will not be deleted.\033[00m"
read -p "Are you sure to delete Yatai in cluster '$(kubectl config current-context)'? [y/n] " -n 1 -r
echo # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

echo "Uninstalling yatai helm chart from cluster.."
helm uninstall yatai -n yatai-system

echo "Deleting all crd resources and BentoDeployment.."
kubectl delete crd bentodeployments.serving.yatai.ai
kubectl delete crd deployments.component.yatai.ai

echo "Removing additional yatai related namespaces and resources.."
kubectl delete namespace yatai-components
kubectl delete namespace yatai-operators
kubectl delete namespace yatai-builders
kubectl delete namespace yatai
kubectl delete namespace yatai-system

echo "Done"
