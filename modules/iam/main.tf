
resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = "CI/CD Service Account"
  description  = "Service Account for Pipeline"
}

resource "google_project_iam_member" "artifact_registry_pusher" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
