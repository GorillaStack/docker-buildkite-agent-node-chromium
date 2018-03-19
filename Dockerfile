FROM buildkite/agent:ubuntu
MAINTAINER Elliott Spira <elliott@gorillastack.com>

# Default to most recent version of nvm (at time of creation)
ARG nvm_version=0.33.8

# Default to our current version of Node
ARG node_version=7.8.0

# Export our custom NVM_DIR
ENV NVM_DIR /usr/local/nvm

# Install nvm
RUN curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v${nvm_version}/install.sh \
  | NVM_DIR=/usr/local/nvm bash

# Install a version of node
RUN [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install ${node_version} && npm install -g grunt

# Install Chromium
RUN apt-get update && apt-get -y install chromium-browser
