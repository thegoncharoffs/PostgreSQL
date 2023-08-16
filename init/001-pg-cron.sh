#!/bin/sh
# Add pg_cron settings
echo "shared_preload_libraries = 'pg_cron'" >> ${PGDATA}/postgresql.conf
echo "cron.database_name = 'test'" >> ${PGDATA}/postgresql.conf
# Required to load pg_cron
pg_ctl restart 