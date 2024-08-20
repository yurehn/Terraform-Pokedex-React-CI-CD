variable "region_name" {
    type = string
    description = "default is us-central1"
    default = "us-central1"
}

variable "vm_service_account" {
    type = string
    default = "pokedex-pipeline@direct-outlook-429315-s5.iam.gserviceaccount.com"
}
