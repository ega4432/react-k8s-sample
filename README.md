# React Kubernetes Sample App

## Overview

This is a sample code that uses Docker Desktop to deploy React locally on kubernetes.

## Pre Requirements

- Docker Desktop
- Node/npm

## Setup

1. If you have a [Docker Hub](https://hub.docker.com/) account.

```sh
% cp .env.example .env.local

# Edit your account info.
% vim .env.local

# Build docker image and push to your registry.
% ./push-to-registry.sh

# Edit manifest file line 17. Update the value of the key `spec.template.spec.containers[0].image` with your account name.
% vim ./deployment-service.yaml
```

2. If you don't have a [Docker Hub](https://hub.docker.com/) account or you want to start quickly.

You can use public sample image of this repository owner. The sample code is designed to use it, so there is no particular change.

## Usage

```sh
# Dry run
% kubectl apply --filename ./k8s/deployment-service.yaml \
  --dry-run=client

# Apply
% kubectl apply --filename ./k8s/deployment-service.yaml

# Check
% kubectl get all | grep -v kubernetes
```

The browser opened automatically and displayed the default React application.

### Cleanup

```sh
% kubectl delete --filename ./k8s/deployment-service.yaml
```

## Links

- [Docker Hub](https://hub.docker.com/repository/docker/ega4432/react-k8s-sample)
- [React アプリを Kubernetes で動かしてみた - Zenn.dev](https://zenn.dev/ysmtegsr/articles/258a2ac221a036e18d6b)

## License

- [MIT](https://github.com/ega4432/react-k8s-sample/blob/main/LICENSE)
