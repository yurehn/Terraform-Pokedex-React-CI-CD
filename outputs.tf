output "machine_ips" {
  value = module.compute-engine.machine_ips
}

output "cloud_run_url" {
  description = "The URL of the Cloud Run service"
  value       = module.cloud-run.cloud_run_url
}
