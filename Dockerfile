FROM postgres
ARG GIT_COMMIT=""
CMD echo 'echo "git commit = $GIT_COMMIT"' >> ./initdb.sh
COPY ./initdb.sh /docker-entrypoint-initdb.d/initdb.sh
EXPOSE 5432
