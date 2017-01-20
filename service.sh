#!/usr/bin/env bash

set -f -o pipefail

source lib/logger
source lib/http_helpers
source lib/parse_path
source lib/parse_request
source lib/docker_request
source lib/main

: ${DOCKER_NAMESPACE:="nasoym"}
: ${DOCKER_CONTROLLER:="localhost:8080"}

main

