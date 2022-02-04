#!/bin/bash

# Use helm to remove yatai installation
helm uninstall yatai -n yatai-system

# Remove additional yatai related namespaces
kubectl delete namesapce yatai-components
kubectl delete namespace yatai-operators
kubectl delete namespace yatai-builders
kubectl delete namespace yatai
