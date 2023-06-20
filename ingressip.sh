#!/bin/bash

# Define the namespace and ingress name
namespace="prod"
ingress_name="ingress-2048"

# Get the external IP address or hostname from the Ingress resource
external_address=$(kubectl get ingress -n "$namespace" "$ingress_name" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
if [ -z "$external_address" ]; then
  external_address=$(kubectl get ingress -n "$namespace" "$ingress_name" -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
fi

# Print the external IP address or hostname
echo "$external_address"
