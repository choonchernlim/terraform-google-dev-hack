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

gsutil_rsync() {
  source="$1"
  destination="$2"

  if [[ -z "${source}" ]]; then
    tgdh_log "ERROR: First argument must be a source path (dir path or gs://[BUCKET_NAME])."
    exit 1
  fi

  if [[ -z "${destination}" ]]; then
    tgdh_log "ERROR: Second argument must be a destination path (dir path or gs://[BUCKET_NAME])."
    exit 1
  fi

  tgdh_log "Performing \"dry run\" rsync from ${source} to ${destination}..."
  gsutil -m rsync -d -r -n "${source}" "${destination}"

  tgdh_log "Do you really want to apply these changes? [ Press any key to continue ] [ CTRL+C to quit ]"
  sh -c "read -n 1 -r"

  tgdh_log "Rsync'ing from ${source} to ${destination}..."
  gsutil -m rsync -d -r "${source}" "${destination}"
}
