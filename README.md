# React Kubernetes Sample App

## Overview

This is a sample code that uses [Minikube](https://github.com/kubernetes/minikube) to deploy React locally on kubernetes.

## Pre Requirements

- Git/GitHub
- Docker
- Minikube
- Node

## Setup

1. If you have a [Docker Hub](https://hub.docker.com/) account.

```sh
% cp .env.example .env.local

# Edit your account info.
% vim .env.local

# Build docker image and push to your registry.
% ./setup.sh

# Edit manifest file line 17. Update the value of the key `spec.template.spec.containers[0].image` with your account name.
% vim ./deployment-service.yaml
```

2. If you don't have a [Docker Hub](https://hub.docker.com/) account or you want to start quickly.

You can use public sample image of this repository owner. The sample code is designed to use it, so there is no paticular change.

## Usage

```sh
# Start cluster using Minikube
% minikube start

# Dry run
% kubectl apply --filename ./deployment-service.yaml \
  --dry-run=client

# Apply
% kubectl apply --filename ./deployment-service.yaml

# Check
% kubectl get all | grep -v kubernetes

# Publish service
% minikube service react-k8s-sample
```

The browser opened automatically and displayed the default React application :tada:

### Cleanup

```sh
% kubectl delete --filename ./deployment-service.yaml

% minikube stop

% minikube delete
```

## Links

- [Docker Hub](https://hub.docker.com/repository/docker/ega4432/react-k8s-sample)
- [React アプリを Kubernetes で動かしてみた - Zenn.dev](https://zenn.dev/ysmtegsr/articles/258a2ac221a036e18d6b)

## License

- [MIT](https://github.com/ega4432/react-k8s-sample/blob/main/LICENSE)
