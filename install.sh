#!/usr/bin/env sh

. ./project.sh

echo "installing node dependencies..."
if ! npm install; then
  echo "installing node dependencies failed"
  exit 1
fi

echo "done"
