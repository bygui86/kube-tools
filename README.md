
# kube-tools

Linux based container image containing some Kubernetes tools to make ops life easier dealing with Kubernetes clusters.

This project was inspired by [lucj/k8tools](https://github.com/lucj/k8stools).

## Content

The image contains:
- common packages
  - vim
  - bash-completion
  - ca-certificates
  - git
  - curl
  - httpie
  - jq
  - yq
- Cloud related tools
  - gcloud sdk
- Kubernetes related tools
  - kubectl (with bash completion)
  - kubectl aliases (https://github.com/ahmetb/kubectl-aliases)
  - kubectx / kubens (https://github.com/ahmetb/kubectx)
  - kube-ps1 (https://github.com/jonmosco/kube-ps1)
  - k9s
  - stern
  - k8stail
  - k8sec
  - kustomize
  - helm (v2 and v3)

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
- [x] put container to sleep for other kind of usages
- [x] add kustomize
- [x] add gcloud sdk
- [x] add k8sec
- [x] add k8stail
- [x] add stern
- [x] add yq
- [x] add httpie
- [ ] add certbot
- [ ] add certbot-dns-google plugin
- [ ] add python3
- [ ] add golang
- [ ] review kubectl aliases
- [ ] exec as non root (use 1001)
- [ ] use a script as entrypoint
- [ ] create a makefile
### optional
- [x] add popeye
- [x] add rbac-lookup
- [ ] add kubectl krew
- [ ] add zsh
- [ ] add zsh-completion
- [ ] remove root commands
  - [ ] su
  - [ ] sudo
