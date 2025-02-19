#!/bin/bash
set -e

# Create tmp directories if they don't exist and set permissions
mkdir -p tmp/pids tmp/sockets tmp/cache
chmod 777 -R tmp

# Remove the server PID file if it exists
if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

bin/rails db:migrate

# Execute the CMD provided
exec "$@"