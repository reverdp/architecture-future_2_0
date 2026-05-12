output "vm_id" {
  description = "ID созданной виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя созданной виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "vm_fqdn" {
  description = "FQDN созданной виртуальной машины"
  value       = yandex_compute_instance.vm.fqdn
}

output "internal_ip_address" {
  description = "Внутренний IP-адрес VM"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  description = "Внешний IP-адрес VM если включен NAT"
  value       = try(yandex_compute_instance.vm.network_interface[0].nat_ip_address, null)
}

output "attached_disk_id" {
  description = "ID дополнительного диска"
  value       = yandex_compute_disk.attached.id
}

output "boot_disk_id" {
  description = "ID загрузочного диска"
  value       = yandex_compute_disk.boot.id
}

output "attached_disk_name" {
  description = "Имя дополнительного диска"
  value       = yandex_compute_disk.attached.name
}
