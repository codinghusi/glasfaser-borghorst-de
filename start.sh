#!/bin/bash

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app

echo "Starting Node.js app"

# run the app as user 'cloudron'
exec /usr/local/bin/gosu cloudron:cloudron node /app/serve.js
