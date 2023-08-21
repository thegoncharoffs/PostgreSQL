# Launch container
docker compose up

# Attach terminal to postgres container
docker exec -it postgres /bin/bash

# Settings for pg_cron
shared_preload_libraries = 'pg_cron'
cron.database_name = 'test'