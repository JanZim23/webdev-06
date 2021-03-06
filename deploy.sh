#!/bin/bash

export MIX_ENV=prod
export PORT=4799
export NODEBIN=`pwd`/assets/node_modules/.bin
export PATH="$PATH:$NODEBIN"

echo "Building..."

mkdir -p ~/.config

mix deps.get
mix compile
(cd assets && npm install)
(cd assets && webpack --mode production)
mix phx.digest

echo "Generating release..."
mix release

echo "Stopping old copy of app, if any..."
_build/dev/rel/task1/bin/task1 stop || true

echo "Starting app..."

_build/dev/rel/task1/bin/task1 start
