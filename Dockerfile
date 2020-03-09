FROM postgres
COPY ./initdb.sh /docker-entrypoint-initdb.d/initdb.sh
EXPOSE 5432
VOLUME ["/var/lib/postgresql/data"]
