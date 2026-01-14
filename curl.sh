#!/bin/bash
set -a  # automatically export all variables
source ./user-values.env
# Get the cluster domain name
export CLUSTER_DOMAIN_NAME=`oc get ingresses.config/cluster -o jsonpath='{.spec.domain}'`
set +a

curl -X POST \
   https://granite-${NAMESPACE}.${CLUSTER_DOMAIN_NAME}/v1/chat/completions \
  -H 'Authorization: Bearer fake-api-key' \
  -H 'Content-Type: application/json' \
  -d '{
    "model": "granite-3-1-8b-instruct-quantized-w8a8",
    "messages": [
      {
        "role": "user",
        "content": "Whats 1 + 1?"
      }
    ]
  }'
