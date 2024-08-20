resource "google_cloud_run_v2_service" "default" {
  name     = var.cloud_run_app
  location = var.region_name

  template {
    containers {
      image = var.app_image_name
      resources {
        limits = {
          memory = "2048Mi"
        }
      }
    }
  }
}

data "google_cloud_run_service" "default" {
  name     = google_cloud_run_v2_service.default.name
  location = google_cloud_run_v2_service.default.location
}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_v2_service.default.location
  project  = google_cloud_run_v2_service.default.project
  service  = google_cloud_run_v2_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
