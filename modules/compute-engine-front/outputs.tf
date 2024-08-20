output "machine_ips" {
  description = "Public IP of the frontend instance"
  value = zipmap(
    google_compute_instance.default[*].name,
    google_compute_instance.default[*].network_interface[0].access_config[0].nat_ip
  )
}

