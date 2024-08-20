
variable "project_id" {
  type        = string
  description = "Google Cloud Platform Project ID"
}

variable "service_account_id" {
  type        = string
  description = "Name of the IAM Service Account"
}

variable "region_name" {
    type = string
    description = "default is us-central1"
    default = "us-central1"
}

variable "cloud_run_app" {
  type = string
}

variable "app_image_name" {
  type = string
}
