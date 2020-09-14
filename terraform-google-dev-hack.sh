#!/bin/bash

BASE_DIR=$(cd "$(dirname "$0")" && pwd)

# shellcheck source=./scripts/init.sh
source "${BASE_DIR}/scripts/init.sh"

# shellcheck source=./scripts/terraform.sh
source "${BASE_DIR}/scripts/terraform.sh"

# shellcheck source=./scripts/gcp.sh
source "${BASE_DIR}/scripts/gcp.sh"
