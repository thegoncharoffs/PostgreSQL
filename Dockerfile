FROM postgres:latest

RUN apt-get update && apt-get -y install git build-essential postgresql-server-dev-15 vim
RUN git clone https://github.com/citusdata/pg_cron.git
RUN cd pg_cron && make && make install 