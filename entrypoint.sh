#!/bin/bash
set -e

# Remove the server PID file if it exists
if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

# Execute the CMD provided
exec "$@"