#!/bin/bash
set -e

IFS=',' read -r -a dbnames <<< "$POSTGRES_MULTIPLE_DATABASES"

for dbname in "${dbnames[@]}"; do
  echo "Creating database $dbname"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOSQL
    CREATE DATABASE $dbname;
EOSQL
done
