#!/bin/bash

set -e
echo "Start entry.sh"
# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

#RAILS_ENV=production NODE_ENV=production RAILS_MASTER_KEY=$RAILS_MASTER_KEY bundle exec rails assets:precompile
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rake assets:precompile

echo "Exit entry.sh"
exec "$@"