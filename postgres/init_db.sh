#!/bin/bash
set -euo pipefail

: "${EMPLOYEE_DB_NAME:?Variabile EMPLOYEE_DB_NAME mancante}"
: "${EMPLOYEE_DB_USER:?Variabile EMPLOYEE_DB_USER mancante}"
: "${EMPLOYEE_DB_PASSWORD:?Variabile EMPLOYEE_DB_PASSWORD mancante}"

psql -v ON_ERROR_STOP=1 \
     --username "$POSTGRES_USER" \
     --dbname "${POSTGRES_DB:-$POSTGRES_USER}" \
     -v app_db="$EMPLOYEE_DB_NAME" \
     -v app_user="$EMPLOYEE_DB_USER" \
     -v app_pwd="$EMPLOYEE_DB_PASSWORD" <<'EOSQL'
CREATE USER :"app_user" WITH PASSWORD :'app_pwd';
CREATE DATABASE :"app_db" OWNER :"app_user";
GRANT ALL PRIVILEGES ON DATABASE :"app_db" TO :"app_user";
EOSQL