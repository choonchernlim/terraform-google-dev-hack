#!/bin/bash

chromebook_init() {
  tgdh_log "Installing/Updating VSCode..."
  VSCODE_DEB_FILE="${HOME}/vscode.deb"
  curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > "${VSCODE_DEB_FILE}"
  sudo apt install "${VSCODE_DEB_FILE}"
  rm "${VSCODE_DEB_FILE}"

  tgdh_log "Installing/Updating Google SDK..."
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add
  sudo apt-get update && sudo apt-get install google-cloud-sdk
}
