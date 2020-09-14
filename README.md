# terraform-google-dev-hack

A compilation of commonly used commands related to Terraform and GCP.

# Getting Started

- Clone this repo.
- In your favorite shell's startup script, add this line: `source [PATH/TO/REPO]/terraform-google-dev-hack.sh`.

# Commands

## Terraform

| Command     | Description |
| ----------- | ----------- |
| `lo`        | Runs both `gcloud auth login` and `gcloud auth application-default login`. |
| `p`         | Recursively formats Terraform files. Initializes working directory by caching modules. Makes all shell scripts executable. Show generated plan (both detailed and summary). |
| `a`         | Runs `terraform apply -auto-approve`. |
| `d`         | Runs `terraform destroy -auto-approve`. |
| `o`         | Runs `terraform output`. |
| `f`         | Runs `terraform fmt -recursive`. |
| `c`         | Recursively delete `.terraform/` and `terraform.tfstate.d/` directories. Useful if your hard drive is running out of space. |

## GCP

| Command     | Description |
| ----------- | ----------- |
| `delete_project` | Deletes the project regardless of the existence of lien.<br/><br/>Usage:<br/>`delete_project [PROJECT_ID]`<br/><br/>Example:<br/>`delete_project my-project-1234`|
| `gsutil_rsync` | Performs a "dry-run" sync either between 2 buckets, dir to bucket or bucket to dir. Prompts for user confirmation before applying the changes. Files in the destination will be deleted if they don't exist in the source.<br/><br/>Usage:<br/>`gsutil_rsync [SOURCE] [DESTINATION]`<br/><br/>Example:<br/>`gsutil_rsync gs://bucket-1234 gs://bucket-5678`<br/>`gsutil_rsync /path/to/dir gs://bucket-5678`<br/>`gsutil_rsync gs://bucket-1234 /path/to/dir`|

## Chromebook

| Command     | Description |
| ----------- | ----------- |
| `chromebook_init` | Installing/Updating VSCode and Google SDK.<br/><br/>Usage:<br/>`chromebook_init`<br/><br/>Example:<br/>`chromebook_init` |
