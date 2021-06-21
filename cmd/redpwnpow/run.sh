#!/bin/sh
# redpwnpow proof of work runner
# https://github.com/redpwn/pow/blob/master/cmd/redpwnpow/run.sh

set -e
version=v0.0.3
challenge=$1
run() {
  cache_root=$HOME/.cache/redpwnpow
  mkdir -p "$cache_root"
  cache_path="$cache_root/redpwnpow-$version"
  case $(uname | tr '[:upper:]' '[:lower:]') in
    linux*) release=linux-amd64;;
    darwin*) release=darwin-amd64;;
    msys*|mingw*|cygwin*) release=windows-amd64.exe;;
    *) echo unknown operating system >&2; exit 1
  esac
  [ -e "$cache_path" ] || curl -sSfLo "$cache_path" "https://github.com/redpwn/pow/releases/download/$version/redpwnpow-$release" && chmod u+x "$cache_path"
  "$cache_path" "$challenge"
}
run
