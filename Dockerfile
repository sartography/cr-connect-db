FROM postgres
COPY ./initdb.sh /docker-entrypoint-initdb.d/initdb.sh

HEALTHCHECK CMD ["pg_isready"]
EXPOSE 5432
