#!/bin/bash

set -e
echo "Start entry.sh"
# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

if [ "${*}" == "bundle exec rails server -e development -b 0.0.0.0" ]; then
  bundle exec rails db:prepare
fi

echo "Exit entry.sh"
exec "$@"