#!/bin/bash

# Define the Kubernetes service name and AWS Route 53 hosted zone ID
hosted_zone_id="Z074130239BXW7W2J0TY9"
record_name="testingbluegreen.groveops.net"
namespace="blue"
ingress_name="ingress-2048"

# Get the external IP address of the Kubernetes service
external_address=$(kubectl get ingress -n "$namespace" "$ingress_name" -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

# Update the Route 53 record with the external IP address
aws route53 change-resource-record-sets --hosted-zone-id "$hosted_zone_id" --change-batch '{
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "'"$record_name"'",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z1H1FL5HABSF5",
          "DNSName": "'"$external_address"'",
          "EvaluateTargetHealth": false
        }
      }
    }
  ]
}'