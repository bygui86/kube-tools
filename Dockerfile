
# base
FROM ubuntu:20.04

# versions
ARG KUBECTL_VERSION=1.18.0
ARG HELM_VERSION=3.1.0
ARG GCLOUDSDK_VERSION=289.0.0
ARG RBAC_LOOKUP_VERSION=0.5.0

# utilities
RUN apt-get update -y \
	&& apt-get install -y curl vim ca-certificates git bash-completion jq gnupg httpie software-properties-common

# set workdir for installing operations
WORKDIR /usr/local/bin

# kubectl with bash completion
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o kubectl \
	&& chmod +x kubectl \
	&& kubectl completion bash > /etc/bash_completion.d/kubectl \
	&& echo "source /etc/bash_completion" >> ~/.bashrc \
	&& echo "source /etc/bash_completion.d/kubectl" >> ~/.bashrc

# kubectl aliases
RUN curl https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -o /.aliases \
	&& echo "source /.aliases" >> ~/.bashrc

# kubectx / kubens
RUN curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -o kubectx \
	&& chmod +x kubectx \
	&& curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -o kubens \
	&& chmod +x kubens

# kube-ps1
RUN curl -L https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh -o kube-ps1.sh \
	&& echo "source /usr/local/bin/kube-ps1.sh" >> ~/.bashrc \
	&& echo "export PS1='[\u@\h \W \$(kube_ps1)] \$ '" >> ~/.bashrc

# kustomize
RUN curl -L https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh -o install_kustomize.sh \
	&& chmod +x install_kustomize.sh \
	&& ./install_kustomize.sh \
	&& chmod +x kustomize \
	&& rm -f install_kustomize.sh

# helm
RUN curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
	&& tar -xf helm.tar.gz \
	&& cp linux-amd64/helm helm \
	&& rm -rf linux-amd64 \
	&& rm -rf helm.tar.gz

# k9s
RUN curl -L https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_x86_64.tar.gz -o k9s.tar.gz \
	&& tar -xf k9s.tar.gz \
	&& chmod +x k9s \
	&& rm -f k9s.tar.gz

# yq
RUN curl -L https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o yq \
	&& chmod +x yq

# k8sec
RUN curl -L https://github.com/dtan4/k8sec/releases/latest/download/k8sec_Linux_arm64.tar.gz -o k8sec_Linux_arm64.tar.gz \
	&& tar -xf k8sec_Linux_arm64.tar.gz \
	&& chmod +x k8sec \
	&& rm -f k8sec_Linux_arm64.tar.gz

# k8tail
# TODO replace once release issues are solved
# RUN curl -L https://github.com/dtan4/k8stail/releases/latest/download/k8stail_Linux_arm64.tar.gz -o k8stail_Linux_arm64.tar.gz \
RUN curl -L https://github.com/dtan4/k8stail/releases/download/v0.7.0-rc1/k8stail_Linux_arm64.tar.gz -o k8stail_Linux_arm64.tar.gz \
	&& tar -xf k8stail_Linux_arm64.tar.gz \
	&& chmod +x k8stail \
	&& rm -f k8stail_Linux_arm64.tar.gz

# stern
RUN curl -L https://github.com/wercker/stern/releases/latest/download/stern_linux_amd64 -o stern \
	&& chmod +x stern

# gcloud sdk
RUN curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUDSDK_VERSION}-linux-x86_64.tar.gz -o gcloud-sdk.tar.gz \
	&& tar -xf gcloud-sdk.tar.gz \
	&& ln -s google-cloud-sdk/bin/gcloud gcloud \
	&& ln -s google-cloud-sdk/bin/gsutil gsutil \
	&& rm -f gcloud-sdk.tar.gz

# popeye
RUN curl -L https://github.com/derailed/popeye/releases/latest/download/popeye_Linux_arm64.tar.gz -o popeye_Linux_arm64.tar.gz \
	&& tar -xf popeye_Linux_arm64.tar.gz \
	&& chmod +x popeye \
	&& rm -f popeye_Linux_arm64.tar.gz

# rbac-lookup
RUN curl -L https://github.com/FairwindsOps/rbac-lookup/releases/download/v${RBAC_LOOKUP_VERSION}/rbac-lookup_${RBAC_LOOKUP_VERSION}_Linux_x86_64.tar.gz -o rbac-lookup_Linux_x86_64.tar.gz \
	&& tar -xf rbac-lookup_Linux_x86_64.tar.gz \
	&& chmod +x rbac-lookup \
	&& rm -f rbac-lookup_Linux_x86_64.tar.gz

RUN rm -f LICENSE
RUN rm -f *.md

WORKDIR /

# USER 1000

ENV KUBECONFIG=/kubeconfig
ENTRYPOINT [ "bash -c sleep 30d" ]
