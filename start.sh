#!/bin/bash

export MIX_ENV=prod
export PORT=4792

echo "Stopping old copy of app, if any..."

_build/prod/rel/task1/bin/task1 stop || true

echo "Starting app..."

# TODO: You want start.

_build/prod/rel/task1/bin/task1 start

# TODO: Add a cron rule or systemd service file
#       to start your app on system boot.
