FROM ubuntu:20.10

RUN apt -y update && apt -y install curl git python3

RUN curl -OL https://github.com/tfsec/tfsec/releases/download/v0.39.42/tfsec-linux-amd64
RUN mv tfsec-linux-amd64 /usr/bin/tfsec
RUN chmod u+x /usr/bin/tfsec

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.2.0/kustomize_v4.2.0_linux_amd64.tar.gz -o kustomize.tar.gz
RUN tar xzvf kustomize.tar.gz -C /usr/bin/

RUN curl -L https://github.com/FairwindsOps/pluto/releases/download/v4.2.0/pluto_4.2.0_linux_amd64.tar.gz -o pluto.tar.gz
RUN tar xzvf pluto.tar.gz -C /usr/bin/

RUN curl -L https://github.com/open-policy-agent/conftest/releases/download/v0.26.0/conftest_0.26.0_Linux_x86_64.tar.gz -o conftest.tar.gz
RUN tar xzvf conftest.tar.gz -C /usr/bin/

RUN curl -L https://github.com/aquasecurity/trivy/releases/download/v0.19.2/trivy_0.19.2_Linux-64bit.tar.gz -o trivy.tar.gz
RUN tar xzvf trivy.tar.gz -C /usr/bin/

RUN curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-360.0.0-linux-x86_64.tar.gz -o gcloud-sdk.tar.gz
RUN tar xzvf gcloud-sdk.tar.gz && cd google-cloud-sdk && bash ./install.sh --usage-reporting false --command-completion false --path-update true --rc-path /root/.bashrc
