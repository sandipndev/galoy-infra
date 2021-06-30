#!/bin/bash

set -eu

source pipeline-tasks/ci/tasks/helpers.sh

pushd repo/examples/gcp

init_kubeconfig

cat <<EOF >> bootstrap/main.tf

terraform {
  backend "kubernetes" {
    secret_suffix = "testflight"
    namespace = "concourse-tf"
  }
}
EOF

update_examples_git_ref

make init
make bootstrap