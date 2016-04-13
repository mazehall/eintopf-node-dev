#!/usr/bin/env sh

. ./project.sh

if ! [ -d "$PROJECT_PATH/web/.git" ]; then
  echo "cloning node sources..."
  cd ${PROJECT_PATH}
  if ! git clone https://github.com/mazelab/node-dev web; then
    echo "git clone failed"
    exit 1
  fi
fi

if ! [ -d "$PROJECT_PATH/web/node_modules" ]; then
  echo "installing node dependencies..."
  cd ${PROJECT_PATH}/web
  if ! npm install; then
    echo "installing node dependencies failed"
    exit 1
  fi
fi

# add additional build steps like gulp or grunt

xcompose "up -d"
echo "done"
