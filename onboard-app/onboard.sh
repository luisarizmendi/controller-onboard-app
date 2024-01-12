#!/bin/bash

# Check if the required argument is provided
if [ -z "$1" ]; then
  echo "Error: Please provide the path to the APP onboarding variables file"
  exit 1
fi

# Path to the variable file provided as an argument
variable_file_path="$1"

# Check if the variable file exists
if [ ! -f "$variable_file_path" ]; then
  echo "Error: APP onboarding variables file '$variable_file_path' does not exist."
  exit 1
fi

# Execute ansible-playbook with variables from controller-vars.yml and the specified variable file
ansible-playbook  ansible/app-onboard.yml -vvv \
  --extra-vars "@ansible/controller-vars.yml" \
  --extra-vars "@$variable_file_path"
