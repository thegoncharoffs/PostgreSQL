1. docker compose up
2. docker exec -it postgres_test /bin/bash 
3. vi var/lib/postgresql/data/postgresql.conf
    shared_preload_libraries = 'pg_cron'
    cron.database_name = 'scheduletest'
4. esc / :x  / enter
5. exit 
6. docker restart postgres_test



apt-get install vim
docker cp postgres_test:/var/lib/postgresql/data/postgresql.conf ./postgresql.conf

shared_preload_libraries = 'pg_cron'
cron.database_name = 'scheduletest'

/var/lib/postgresql/data/postgresql.conf