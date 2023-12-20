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


#
# install terraformer
ARG TERRAFORMER_FILE="terraformer-azure-linux-amd64"
ARG TERRAFORMER_URL="https://github.com/GoogleCloudPlatform/terraformer/releases/download/0.8.24/${TERRAFORMER_FILE}"

## (force IPv4 as default IPv6 fails)
RUN wget -4 "${TERRAFORMER_URL}" \ 
    && chmod +x "${TERRAFORMER_FILE}" \
    && sudo mv "${TERRAFORMER_FILE}" /usr/local/bin/terraformer
