#!/usr/bin/env bash

set -e

# Check if a command (apply or destroy) is provided as an argument
ACTION="$1"

# Ensure the ACTION is provided and valid
if [[ -z "$ACTION" ]]; then
  echo "Usage: $0 {apply|destroy}"
  exit 1
fi

# Function to run terraform commands
run_terraform() {
  local action=$1

  case "$action" in
    apply)
      cd cluster && terraform plan && terraform apply -auto-approve
      cd - || exit 1
      cd cluster-res && terraform plan && terraform apply -auto-approve
      ;;
    destroy)
      cd cluster-res && terraform destroy -auto-approve
      cd - || exit 1
      cd cluster && terraform destroy -auto-approve
      ;;
    *)
      echo "Invalid action: $action. Use 'apply' or 'destroy'."
      exit 1
      ;;
  esac
}

run_terraform "$1"
