#!/usr/bin/env bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
script="${parent_path}/../src"
configDir="${parent_path}/../config"
if [[ -z "${MAX_STACK_SIZE}" ]]; then
  NODE_CONFIG_DIR="${configDir}" node "$script"
else
  NODE_CONFIG_DIR="${configDir}" node "--stack-size=${MAX_STACK_SIZE}" "$script"
fi
