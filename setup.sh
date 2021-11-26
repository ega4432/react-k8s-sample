#!/bin/sh
set -eu

export $(cat .env.local | grep -v ^# | xargs)

echo "$DOCKER_HUB_PASSWORD" | \
    docker login --username $DOCKER_HUB_USERNAME \
        --password-stdin 

docker build --no-cache \
    --tag $DOCKER_HUB_USERNAME/react-k8s-sample:latest \
    --file ./Dockerfile .

docker push $DOCKER_HUB_USERNAME/react-k8s-sample:latest
