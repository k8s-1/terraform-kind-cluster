#!/usr/bin/env bash

export KUBECONFIG=../cluster/test-cluster-config
terraform plan && terraform apply -auto-approve

