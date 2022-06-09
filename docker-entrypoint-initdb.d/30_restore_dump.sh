#!/bin/bash
set -e

psql -d ckan -U "$POSTGRES_USER" < /docker-entrypoint-initdb.d/sql/roles.sql
if [[ -f "docker-entrypoint-initdb.d/seed/ckan.dump" ]]
then
    pg_restore --clean --if-exists -U "$POSTGRES_USER" -d ckan < /docker-entrypoint-initdb.d/seed/ckan.dump
fi
