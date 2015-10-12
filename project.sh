#!/usr/bin/env bash

#####
# change this part for your own configuration
#####

PROJECT_DIR="node"
CONFIG_DIR="${PWD##*/}"

####
. ./project.env.sh
####


####
# implement you own cli wrapper
####

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
  if callInbox "which docker-compose >> /dev/null"; then
      xcompose () {
          callInbox "docker-compose $@"
      }
  fi
  if callInbox "which npm >> /dev/null"; then
      xnpm () {
          callInbox "npm $@" "$INBOX_PROJECT_PATH"
      }
  fi
fi