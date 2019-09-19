#!/bin/bash
set -e

run_migrations() {
  rake db:migrate 2>/dev/null || echo "Creating database..." && rake db:create db:schema:load db:migrate
}

launch_dev() {
  RAILS_ENV=development rails server --port 3000 --binding 0.0.0.0
}

launch_prod() {
  RAILS_ENV=production rails server
}

run_unit_tests() {
  exec rake test
}

if [ "$1" == "rt_plan_classifier" ]; then
  if [ ${DB_MIGRATIONS_ENABLED} == "true" ]; then
    echo 'Running database migrations'
    sleep 2
    run_migrations
  fi

  if [ -e tmp/pids/server.pid ]; then
    echo "Removing server.pid"
    rm tmp/pids/server.pid
  fi

  echo "Running in MODE: ${MODE}"
  if [ ${MODE} == "unit_tests" ]; then
    run_unit_tests
  elif [ ${MODE} == "production" ]; then
    launch_prod
  elif [ ${MODE} == "development" ]; then
    launch_dev
  fi
fi

exec "$@"
