#!/bin/bash

# Use helm to remove yatai installation
helm uninstall yatai

# Remove additional yatai related namespaces
kubectl delete namesapce yatai-components
kubectl delete namespace yatai-operators
