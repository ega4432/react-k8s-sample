#!/bin/bash -eu

cd "$(dirname "$0")"

if [ ! -f .env.local ]; then
    echo ".env.local does not exist ..."
    exit 1
fi

source .env.local

echo "$DOCKER_HUB_PASSWORD" | \
    docker login --username "$DOCKER_HUB_USERNAME" \
        --password-stdin

docker build --no-cache --force-rm \
    --tag "$DOCKER_HUB_USERNAME"/react-k8s-sample:latest \
    --file ./docker/Dockerfile .

docker push "$DOCKER_HUB_USERNAME"/react-k8s-sample:latest

echo "Pushed to https://hub.docker.com/repository/docker/$DOCKER_HUB_USERNAME/react-k8s-sample"
