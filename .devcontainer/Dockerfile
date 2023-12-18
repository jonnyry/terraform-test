FROM mcr.microsoft.com/devcontainers/base:alpine-3.18

# install terraform
#
ARG TERRAFORM_VERSION=1.6.6
ARG TERRAFORM_ZIP=terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip
ARG TERRAFORM_URL=https://releases.hashicorp.com/terraform/"${TERRAFORM_VERSION}"/"${TERRAFORM_ZIP}"

RUN mkdir tftmp \
    && cd tftmp \
    && wget "${TERRAFORM_URL}" \
    && unzip "${TERRAFORM_ZIP}" \
    && mv terraform /usr/bin/terraform \
    && cd .. \ 
    && rm -rf tftmp


#
# install python
RUN apk add py3-pip \
    && apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make \
    && pip install --upgrade pip

#
# install az cli
RUN pip install azure-cli
