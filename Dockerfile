FROM postgres:12
COPY ./initdb.sh /docker-entrypoint-initdb.d/initdb.sh
EXPOSE 5432
