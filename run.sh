#!/usr/bin/env bash
set -ef -o pipefail

while getopts "p:v" options; do case $options in
  v) SOCAT_OPTIONS="-vv" ;;
  p) PORT="$OPTARG" ;;
esac; done; shift $(( OPTIND - 1 ))

: ${PORT:="9090"}
: ${SOCAT_OPTIONS:=""}
: ${SERVICE:="$(dirname $0)/service.sh"}

socat_listen_command="TCP-LISTEN:${PORT},reuseaddr,fork"

socat \
  $SOCAT_OPTIONS \
  $socat_listen_command \
  EXEC:"${SERVICE}"

