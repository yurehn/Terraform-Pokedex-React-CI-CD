
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

resource "google_project_iam_member" "storage_object_admin" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
