FROM postgres
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT
COPY ./initdb.sh /docker-entrypoint-initdb.d/initdb.sh
CMD echo 'echo "git commit = $GIT_COMMIT"' >> /docker-entrypoint-initdb.d/initdb.sh
EXPOSE 5432
