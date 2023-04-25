data "yandex_compute_image" "my_image" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "vm" {
  count         = length(var.vm_suffixes)
  name          = "${var.instance_name}-${element(var.vm_suffixes, count.index)}"
  platform_id   = var.vm_type
  zone          = var.zone

  scheduling_policy {
    preemptible = var.preemptible
  }

  resources {
    cores       = var.resources_cores
    memory      = var.resources_memory
  }

  boot_disk {
    initialize_params {
      image_id  = "ubuntu-2004-lts"
      type      = var.disk_type
      size      = var.disk_size
    }
  }

  network_interface {
    subnet_id   = var.subnet_id
    nat         = var.nat
  }

  metadata = {
    user-data   = "${file("meta.yaml")}"
  }
}
