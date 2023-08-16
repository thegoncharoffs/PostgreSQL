docker compose up

# Settings for pg_cron
shared_preload_libraries = 'pg_cron'
cron.database_name = 'test'