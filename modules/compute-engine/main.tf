locals {
  default_vm_service_account = var.vm_service_account
  vm_machines                = jsondecode(file("${path.module}/vm-machines.json"))
  vm_zone                    = "${var.region_name}-a"

  # Mapa para asignar scripts de inicio según el nombre de la máquina
  startup_scripts = {
    "virtual-machine-pokeapi"        = "${path.module}/startupScripts/startup-script-front.sh"
    "virtual-machine-pokeapi-backend" = "${path.module}/startupScripts/startup-script-back.sh"
  }
}

resource "google_compute_instance" "default" {
  count = length(local.vm_machines)

  lifecycle {
    prevent_destroy = false
  }

  name         = local.vm_machines[count.index].name
  machine_type = local.vm_machines[count.index].machine_type
  zone         = local.vm_zone
  tags         = local.vm_machines[count.index].tags

  boot_disk {
    initialize_params {
      size  = local.vm_machines[count.index].boot_disk_size
      image = local.vm_machines[count.index].image
    }
  }

  labels = {
    my_label = "virtual-machine-pokeapi"
  }

  network_interface {
    network = "default"
    access_config {}
  }

  # Ejecutar el script de inicio correspondiente
  metadata_startup_script = file(local.startup_scripts[local.vm_machines[count.index].name])

  service_account {
    email  = local.default_vm_service_account
    scopes = ["cloud-platform"]
  }
}
