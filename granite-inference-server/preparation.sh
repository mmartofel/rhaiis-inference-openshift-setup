#!/bin/bash
set -a  # automatically export all variables
source ../user-values.env
# Get the cluster domain name
export CLUSTER_DOMAIN_NAME=`oc get ingresses.config/cluster -o jsonpath='{.spec.domain}'`
set +a

# Process all yaml template files
for template in *.yaml.template; do
    envsubst < "$template" > "${template%.template}.local"
done

# Process all sh template files
for template in *.sh.template; do
    envsubst < "$template" > "${template%.template}.local"
done

chmod +x *.sh.local

# Rename processed kustomize
mv kustomization.yaml.local kustomization.yaml
