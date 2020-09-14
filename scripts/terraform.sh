#!/bin/bash

lo() {
  gcloud auth login
  gcloud auth application-default login
}

p() {
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

a() {
  terraform apply -auto-approve
}

d() {
  terraform destroy -auto-approve
}

o() {
  terraform output
}

f() {
  terraform fmt -recursive
}

c() {
  sh -c "find . \( -name '.terraform' -o -name 'terraform.tfstate.d' \) -type d -prune -exec rm -rf {} \;"
}
