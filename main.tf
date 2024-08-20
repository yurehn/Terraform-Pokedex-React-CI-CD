
terraform {
  cloud {
    organization = "yurehn_corp_inc"

    workspaces {
      name = "Build_Front_Web"
    }
  }
}

module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
  service_account_id  = var.service_account_id
}

module "compute-engine" {
  source = "./modules/compute-engine"
  region_name = var.region_name
}

module "cloud-run" {
  source = "./modules/cloud-run"
  region_name=var.region_name
  cloud_run_app=var.cloud_run_app
  app_image_name=var.app_image_name
}
