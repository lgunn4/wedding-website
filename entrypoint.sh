#!/bin/bash
set -e

# Remove the server PID file if it exists
if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

bin/rails db:migrate

# Execute the CMD provided
exec "$@"