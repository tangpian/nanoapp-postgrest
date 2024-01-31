#!/bin/bash

psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}<<EOF

    \c ${POSTGRES_DB}
    CREATE ROLE ${DB_ANON_ROLE} nologin;
    GRANT ${DB_ANON_ROLE} TO ${POSTGRES_USER};

    -- create schema for config
    create schema postgrest;
    -- grant usage on this schema to the authenticator
    grant usage on schema postgrest to "${POSTGRES_USER}";

    -- the function can configure postgREST by using set_config
    create or replace function postgrest.pre_config()
    returns void as \$\$
    select set_config('pgrst.db_schemas', '${BACKEND_DB_SCHEMA}', true);
    select set_config('pgrst.db_anon_role', '${DB_ANON_ROLE}', true);
    \$\$ language sql;


    -- backend db init
    create schema ${BACKEND_DB_SCHEMA};
    ALTER DEFAULT PRIVILEGES IN SCHEMA ${BACKEND_DB_SCHEMA} GRANT ALL PRIVILEGES ON TABLES TO ${DB_ANON_ROLE};

    grant usage on schema ${BACKEND_DB_SCHEMA} to ${DB_ANON_ROLE};
    GRANT ALL ON ALL TABLES IN SCHEMA ${BACKEND_DB_SCHEMA} TO ${DB_ANON_ROLE};

EOF