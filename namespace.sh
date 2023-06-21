# #!/bin/bash
# namespace="blue"

# # Check if the namespace already exists
    
# if kubectl get namespace "$namespace" &>/dev/null; then
#     echo "Namespace '$namespace' already exists. Skipping creation."
# else
#     # Create the namespace
#     kubectl create namespace "$namespace"
#     echo "Namespace '$namespace' created successfully."
# fi

#!/bin/bash

NAMESPACE="blue"

# Check if namespace exists
if kubectl get namespaces | grep -q $NAMESPACE; then
  echo "Namespace $NAMESPACE already exists, skipping..."
else
  echo "Creating namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
fi