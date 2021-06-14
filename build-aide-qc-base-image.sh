#!/bin/bash

yarn
yarn build
yarn build:vscode
yarn release
yarn release:standalone
curl -sfL https://install.goreleaser.com/github.com/goreleaser/nfpm.sh | sh
PATH=$PATH:$PWD/bin yarn package
docker build -t qcor/code-server-base -f ci/release-image/Dockerfile_aide_qc_base .
