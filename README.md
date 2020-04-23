
# kube-tools

Linux based container image containing some Kubernetes tools to make ops life easier dealing with Kubernetes clusters.

This project was inspired by [lucj/k8tools](https://github.com/lucj/k8stools).

## Content

The image contains:
- common packages
  - curl
  - ca-certificates
  - git
  - vim
  - bash-completion
  - jq
- Kubernetes-related tools
  - kubectl (with bash completion)
  - kubectl aliases (https://github.com/ahmetb/kubectl-aliases)
  - kubectx / kubens (https://github.com/ahmetb/kubectx)
  - kube-ps1 (https://github.com/jonmosco/kube-ps1)
  - helm
  - k9s

## Build

```shell
docker build . -t bygui86/kube-tools
```

## Usage

This command run a bash shell in a container based on the kube-tools images
```shell
docker run -ti --rm --name kube-tools\
  -v PATH_TO_KUBE_CONFIG:/kubeconfig \
  bygui86/kube-tools
```

Once in the shell, you can run any *kubectl* commands against the cluster corresponding to the kubeconfig file provided.
```shell
kubectl get pods
```

The great *k9s* tool is available, just run it with
```shell
k9s
```

## TODO

### required
- [x] remove helm2
- [x] remove k9s version and take always latest one
- [?] add kustomize
- [x] add gcloud sdk
- [x] add k8sec
- [x] add k8stail
- [x] add stern
- [x] add yq
- [x] add httpie
- [ ] put container to sleep for other kind of usages
- [ ] review kubectl aliases
- [x] update ubuntu base image
### optional
- [x] add popeye
- [x] add rbac-lookup
- [ ] add kubectl krew
- [ ] add zsh
- [ ] add zsh-completion
- [ ] exec as non root
