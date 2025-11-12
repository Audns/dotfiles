#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Usage: confirm.sh 'command'"
  exit 1
fi

read -r -p "Run '$*' ? [y/N] " response
if [[ "$response" =~ ^[Yy]$ ]]; then
  eval "$*"
else
  echo "Cancelled."
fi
