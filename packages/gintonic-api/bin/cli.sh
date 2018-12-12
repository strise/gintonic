#!/usr/bin/env bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

script="${DIR}/../src"
configDir="${DIR}/../config"
if [[ -z "${MAX_STACK_SIZE}" ]]; then
  NODE_CONFIG_DIR="${configDir}" node "$script"
else
  NODE_CONFIG_DIR="${configDir}" node "--stack-size=${MAX_STACK_SIZE}" "$script"
fi
