module "vm" {
  source = "../../modules/vm"

  vm_name               = var.vm_name
  zone                  = var.zone
  cores                 = var.cores
  memory                = var.memory
  image_family          = var.image_family
  boot_disk_size_gb     = var.boot_disk_size_gb
  attached_disk_name    = var.attached_disk_name
  attached_disk_size_gb = var.attached_disk_size_gb
  subnet_id             = var.subnet_id
  ssh_user              = var.ssh_user
  ssh_public_key        = var.ssh_public_key
}
