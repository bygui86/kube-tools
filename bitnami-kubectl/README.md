
# bitnami-kubectl

## Build & push

```shell script
docker build . -t eu.gcr.io/ceiba-test-infrastructure/tools/bitnami-kubectl:1.19.3
docker push eu.gcr.io/ceiba-test-infrastructure/tools/bitnami-kubectl:1.19.3
```

## Run in Docker

```shell script
docker run --rm -it --name bitnami-kubectl eu.gcr.io/ceiba-test-infrastructure/tools/bitnami-kubectl:1.19.3
```

## Run in Kubernetes

```shell script
kubectl run bitnami-kubectl --rm -it --image=eu.gcr.io/ceiba-test-infrastructure/tools/bitnami-kubectl:1.19.3 -- kubectl get pods
```

## Links

- https://github.com/bitnami/bitnami-docker-kubectl
- https://hub.docker.com/r/bitnami/kubectl/
