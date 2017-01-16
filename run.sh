#!/usr/bin/env bash
set -ef -o pipefail

while getopts "p:v" options; do case $options in
  v) VERBOSE_OPTIONS="-vv" ;;
  p) PORT="$OPTARG" ;;
esac; done; shift $(( OPTIND - 1 ))

: ${PORT:="8080"}
: ${VERBOSE_OPTIONS:=""}
: ${SERVICE:="$(dirname $0)/service.sh"}

socat_listen_command="TCP-LISTEN:${PORT},reuseaddr,fork"

socat \
  $VERBOSE_OPTIONS \
  $socat_listen_command \
  EXEC:"${SERVICE}"

