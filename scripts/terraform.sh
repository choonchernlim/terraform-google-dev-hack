#!/bin/bash

tflo() {
  gcloud auth login
  gcloud auth application-default login
}

tfp() {
  clear
  terraform fmt -recursive
  terraform init
  sh -c "find . -name '*.sh' -type f -exec chmod +x {} \;"
  terraform plan | tee x
  printf '\n'
  printf '%0.s-' {1..73}
  printf '\n'
  grep -E '^\e\[1m  # [^(]+' x | sort
  rm x
}

tfa() {
  terraform apply -auto-approve
}

tfd() {
  terraform destroy -auto-approve
}

tfo() {
  terraform output
}

tff() {
  terraform fmt -recursive
}

tfc() {
  sh -c "find . \( -name '.terraform' -o -name 'terraform.tfstate.d' \) -type d -prune -exec rm -rf {} \;"
}
