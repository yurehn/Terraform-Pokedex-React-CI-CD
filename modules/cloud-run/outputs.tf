
output "cloud_run_url" {
  description = "The URL of the Cloud Run service"
  value       = data.google_cloud_run_service.default.status[0].url
}
