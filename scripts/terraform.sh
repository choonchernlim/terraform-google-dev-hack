#!/bin/bash

alias lo="gcloud auth login && gcloud auth application-default login"

alias p="clear && terraform fmt -recursive && terraform init && (find . -name '*.sh' -type f -exec chmod +x {} \;) && (terraform plan | tee x && echo '\n' && printf '%0.s-' {1..73} && echo '\n' && (grep -E '^\e\[1m  # [^(]+' x | sort) && rm x)"

alias a="terraform apply -auto-approve"

alias d="terraform destroy -auto-approve"

alias o="terraform output"

alias f="terraform fmt -recursive"

alias c="find . \( -name '.terraform' -o -name 'terraform.tfstate.d' \) -type d -prune -exec rm -rf {} \;"
