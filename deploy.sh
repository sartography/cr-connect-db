#!/bin/bash

# Build and push Docker image to Docker Hub
echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
APP="db"
REPO="sartography/cr-connect-$APP"
TAG=$(if [ "$TRAVIS_BRANCH" == "master" ]; then echo "latest"; else echo "$TRAVIS_BRANCH" ; fi)
docker build -f Dockerfile -t "$REPO:$COMMIT" .
docker tag "$REPO:$COMMIT" "$REPO:$TAG"
docker tag "$REPO:$COMMIT" "$REPO:travis-$TRAVIS_BUILD_NUMBER"
docker push "$REPO"

# Wait for Docker Hub
echo "Publishing to Docker Hub..."
sleep 30

# Notify UVA DCOS that Docker image has been updated
echo "Refreshing DC/OS..."
aws sqs send-message --region "$AWS_DEFAULT_REGION" --queue-url "$AWS_SQS_URL" --message-body "crconnect/$TRAVIS_BRANCH/$APP"
