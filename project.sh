#!/usr/bin/env bash

#####
# change this part for your own configuration
PROJECT_DIR="${PWD##*/}"    # start path for all project dev sources (default to last part of path)

#####


. ./project.env.sh

xcompose () {
    cd "$CONFIG_PATH" && docker-compose $@
}
xgit () {
    git "$@"
}
xnpm () {
    cd "$PROJECT_PATH" && npm $@
}

if [ "$INBOX" != true ]; then
  xcompose () {
      callInbox "PROJECT_PATH=${PROJECT_PATH} docker-compose $@"
  }
fi