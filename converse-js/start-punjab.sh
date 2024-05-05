#!/bin/bash

# Start the Node.js application with the Converse.js configuration file
# exec node /usr/share/nginx/html/converse.js/app.js --config /app/converse.js.config.js &

# Start Punjab BOSH connection manager
exec /usr/bin/twistd3 --nodaemon --logfile=- punjab &