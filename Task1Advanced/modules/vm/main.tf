terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.196"
    }
  }
}

resource "yandex_compute_disk" "boot_disk" {
  name     = "${var.vm_name}-boot-disk"
  size     = var.disk_size
  type     = "network-ssd"
  zone     = var.zone
  image_id = var.image_id
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  zone        = var.zone
  platform_id = "standard-v3"

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}