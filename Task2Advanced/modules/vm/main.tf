data "yandex_compute_image" "boot" {
  family = var.image_family
}

resource "yandex_compute_disk" "boot" {
  name     = "${var.vm_name}-boot-disk"
  zone     = var.zone
  type     = var.boot_disk_type
  image_id = data.yandex_compute_image.boot.image_id
  size     = var.boot_disk_size_gb
}

resource "yandex_compute_disk" "attached" {
  name = var.attached_disk_name
  zone = var.zone
  type = var.attached_disk_type
  size = var.attached_disk_size_gb
}

resource "yandex_compute_instance" "vm" {
  name = var.vm_name
  zone = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot.id
  }

  secondary_disk {
    disk_id = yandex_compute_disk.attached.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }
}
