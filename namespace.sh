#!/bin/bash
namespace="blue"

# Check if the namespace already exists
    
if kubectl get namespace "$namespace" &>/dev/null; then
    echo "Namespace '$namespace' already exists. Skipping creation."
else
    # Create the namespace
    kubectl create namespace "$namespace"
    echo "Namespace '$namespace' created successfully."
fi