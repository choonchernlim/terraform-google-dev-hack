#!/bin/bash

delete_project() {
  project_id="$1"

  if [[ -z "${project_id}" ]]; then
    echo "ERROR: First argument must be a project ID."
    exit 1
  fi

  tgdh_log "Setting project [ID: ${project_id}]..."
  gcloud config set project "${project_id}"

  tgdh_log "Finding project lien..."
  lien_id=$(gcloud alpha resource-manager liens list --format=json | jq -r '.[0] .name' | sed -e 's/liens\///g')

  if [[ "${lien_id}" != "null" ]]; then
    tgdh_log "Lien [ID: ${lien_id}] found. Removing project lien..."
    gcloud alpha resource-manager liens delete "${lien_id}"
  else
    tgdh_log "No lien found."
  fi

  tgdh_log "Deleting project..."
  gcloud projects delete "${project_id}" --quiet
}
